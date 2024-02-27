import 'package:koinonia/features/profile-feature/data/userEntity.dart';
import 'package:koinonia/features/profile-feature/domain/repository/UserRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> getCurrentUser() async {
    final authUser = Supabase.instance.client.auth.currentUser;
    if (authUser == null) {
      throw Exception('No user is currently logged in.');
    }

    final response = await Supabase.instance.client
        .from('users')
        .select()
        .eq('user', authUser.id)
        .single(); // Assuming there's only one row per user

    if (response.isEmpty) {
      throw Exception('Failed to fetch user data: ${response["statusText"]}');
    }

    // Assuming `data` contains the response data
    final data = response;
    return UserEntity(
      name: authUser.userMetadata?['full_name'] ?? 'No Name',
      email: authUser.email ?? 'No Email',
      associatedChurch: data['associated_church'] ?? 'No Church',
      qtStreak: data['qt_streak'] ?? 0,
      brStreak: data['br_streak'] ?? 0,
    );
  }
}
