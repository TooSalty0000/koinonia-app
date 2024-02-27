import 'package:koinonia/features/profile-feature/data/userEntity.dart';

abstract class GetCurrentUserUseCase {
  Future<UserEntity?> call();
}
