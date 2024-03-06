import 'package:koinonia/features/profile-feature/domain/entity/UserEntity.dart';
import 'package:koinonia/features/profile-feature/domain/repository/UserRepository.dart';
import 'package:koinonia/features/profile-feature/domain/usecases/UserUseCase.dart';

class GetCurrentUserUseCaseImpl implements GetCurrentUserUseCase {
  final UserRepository _userRepository;

  GetCurrentUserUseCaseImpl(this._userRepository);

  @override
  Future<UserEntity> call() async {
    return await _userRepository.getCurrentUser();
  }
}
