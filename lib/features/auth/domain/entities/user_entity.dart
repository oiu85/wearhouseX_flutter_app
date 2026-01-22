/// User entity representing an authenticated user
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String type; // 'admin' or 'driver'

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
  });

  bool get isAdmin => type == 'admin';
  bool get isDriver => type == 'driver';
}
