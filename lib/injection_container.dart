import 'package:get_it/get_it.dart';
import 'package:koinonia/features/login-feature/domain/repositories/LoginRepository.dart';
import 'package:koinonia/features/login-feature/domain/repositories/LoginRepositoryImpl.dart';
import 'package:koinonia/features/login-feature/domain/usecases/AuthUseCase.dart';
import 'package:koinonia/features/login-feature/domain/usecases/AuthUseCaseImpl.dart';
import 'package:koinonia/features/login-feature/presentation/common/view/AuthViewModel.dart';
import 'package:koinonia/features/profile-feature/domain/repository/UserRepository.dart';
import 'package:koinonia/features/profile-feature/domain/repository/UserRepositoryImpl.dart';
import 'package:koinonia/features/profile-feature/presentation/View/UserViewModel.dart';

final sl = GetIt.instance;

initializeDependencies() async {
  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(
        signInWithGoogleUseCase: sl(),
        signInWithPasswordUseCase: sl(),
        signUpWithPasswordUseCase: sl(),
      ));

  sl.registerFactory<UserBloc>(() => UserBloc(
        userRepository: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCaseImpl(sl()));
  sl.registerLazySingleton<SignInWithPasswordUseCase>(
      () => SignInWithPasswordUseCaseImpl(sl()));
  sl.registerLazySingleton<SignUpWithPasswordUseCase>(
      () => SignUpWithPasswordUseCaseImpl(sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
}
