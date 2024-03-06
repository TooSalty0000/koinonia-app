import 'package:koinonia/features/profile-feature/domain/entity/UserEntity.dart';

abstract class UserRepository {
  Future<UserEntity> getCurrentUser();
}
