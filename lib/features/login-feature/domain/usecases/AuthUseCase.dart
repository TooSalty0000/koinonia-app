import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignInWithGoogleUseCase {
  Future<AuthResponse> call();
}

abstract class SignInWithPasswordUseCase {
  Future<AuthResponse> call(String email, String password);
}

abstract class SignUpWithPasswordUseCase {
  Future<AuthResponse> call(String email, String password);
}
