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

    return Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<AuthResponse> signInWithEmailPassword(
      String _email, String _password) async {
    return await Supabase.instance.client.auth
        .signInWithPassword(email: _email, password: _password);
  }

  @override
  Future<AuthResponse> signUpWithEmailPassword(
      String _email, String _password) async {
    return await Supabase.instance.client.auth
        .signUp(email: _email, password: _password);
  }
}
