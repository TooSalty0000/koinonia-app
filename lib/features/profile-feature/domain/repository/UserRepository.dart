import 'package:koinonia/features/profile-feature/data/userEntity.dart';

abstract class UserRepository {
  Future<UserEntity> getCurrentUser();
}
