class User {
  final String username;
  final String email;
  final DateTime birthdate;
  final String gender;
  final String password;
  final double? weight;
  final double? height;
  User({
    required this.username,
    required this.email,
    required this.birthdate,
    required this.gender,
    required this.password,
    this.weight,
    this.height,
  });
}