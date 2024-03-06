import 'package:koinonia/features/profile-feature/domain/entity/UserEntity.dart';

abstract class GetCurrentUserUseCase {
  Future<UserEntity?> call();
}
