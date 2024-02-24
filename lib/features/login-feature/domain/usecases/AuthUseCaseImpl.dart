import 'package:koinonia/features/login-feature/domain/repositories/LoginRepository.dart';
import 'package:koinonia/features/login-feature/domain/usecases/AuthUseCase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInWithGoogleUseCaseImpl implements SignInWithGoogleUseCase {
  final LoginRepository _loginRepository;

  SignInWithGoogleUseCaseImpl(this._loginRepository);

  @override
  Future<AuthResponse> call() async {
    return await _loginRepository.signInWithGoogle();
  }
}

class SignInWithPasswordUseCaseImpl implements SignInWithPasswordUseCase {
  final LoginRepository _loginRepository;

  SignInWithPasswordUseCaseImpl(this._loginRepository);

  @override
  Future<AuthResponse> call(String email, String password) async {
    return await _loginRepository.signInWithEmailPassword(email, password);
  }
}

class SignUpWithPasswordUseCaseImpl implements SignUpWithPasswordUseCase {
  final LoginRepository _loginRepository;

  SignUpWithPasswordUseCaseImpl(this._loginRepository);

  @override
  Future<AuthResponse> call(String email, String password) async {
    return await _loginRepository.signUpWithEmailPassword(email, password);
  }
}
