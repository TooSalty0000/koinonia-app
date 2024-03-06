class UserEntity {
  final String name;
  final String email;
  final String associatedChurch;
  final int qtStreak;
  final int brStreak;

  UserEntity({
    required this.name,
    required this.email,
    required this.associatedChurch,
    required this.qtStreak,
    required this.brStreak,
  });
}
