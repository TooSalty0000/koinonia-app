// Event definitions
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:koinonia/features/login-feature/domain/usecases/AuthUseCase.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInWithPasswordEvent(this.email, this.password);
}

class SignUpWithPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const SignUpWithPasswordEvent(this.email, this.password);
}

// State definitions
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState(this.message);
}

// BLoC definition
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithPasswordUseCase signInWithPasswordUseCase;
  final SignUpWithPasswordUseCase signUpWithPasswordUseCase;

  AuthBloc({
    required this.signInWithGoogleUseCase,
    required this.signInWithPasswordUseCase,
    required this.signUpWithPasswordUseCase,
  }) : super(AuthInitialState()) {
    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await signInWithGoogleUseCase();
        emit(AuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<SignInWithPasswordEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await signInWithPasswordUseCase(event.email, event.password);
        emit(AuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<SignUpWithPasswordEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await signUpWithPasswordUseCase(event.email, event.password);
        emit(AuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}
