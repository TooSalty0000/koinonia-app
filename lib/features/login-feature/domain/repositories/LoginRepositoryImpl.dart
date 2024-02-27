import 'package:google_sign_in/google_sign_in.dart';
import 'package:koinonia/features/login-feature/domain/repositories/LoginRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<AuthResponse> signInWithGoogle() async {
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId =
        '964983718901-7hfto6niomfethpsm57lg9ud8tms5qj3.apps.googleusercontent.com';

    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId =
        '964983718901-go2ffijneo75brbtd945thgtgbkvf9lv.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    final response = await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    // Check if sign-in was successful and user is not null
    if (response.user != null) {
      // Call the function to create a user in the database
      await ensureUserRowExists(response.user!.id);
    }

    return response;
  }

  @override
  Future<AuthResponse> signInWithEmailPassword(
      String _email, String _password) async {
    final response = await Supabase.instance.client.auth
        .signInWithPassword(email: _email, password: _password);

    if (response.user != null) {
      // Call the function to create a user in the database
      await ensureUserRowExists(response.user!.id);
    }

    return response;
  }

  @override
  Future<AuthResponse> signUpWithEmailPassword(
      String _email, String _password) async {
    final response = await Supabase.instance.client.auth
        .signUp(email: _email, password: _password);

    if (response.user != null) {
      // Call the function to create a user in the database
      await ensureUserRowExists(response.user!.id);
    }

    return response; // Return the original AuthResponse
  }

  Future<void> ensureUserRowExists(String userId) async {
    final userExistsResponse = await Supabase.instance.client
        .from('users')
        .select()
        .eq('user', userId);

    // Check if the user row already exists
    if (userExistsResponse.isEmpty) {
      // If there's an error, or if user doesn't exist, try to insert the user
      await createUserInDatabase(userId);
    }
  }

  Future<void> createUserInDatabase(String userId) async {
    await Supabase.instance.client.from('users').insert({'user': userId});
  }
}
