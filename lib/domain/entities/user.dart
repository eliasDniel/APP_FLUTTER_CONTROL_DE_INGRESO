class User {
  // final int id;
  final bool isActive;
  final String username;
  final String lastname;
  final String email;
  final bool isStaff;
  User({
    // required this.id,
    required this.isActive,
    required this.username,
    required this.email,
    required this.isStaff,
    required this.lastname
  });
}
