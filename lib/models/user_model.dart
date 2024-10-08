class User {
  final String avatar;
  final String firstName;
  final String lastName;
  final String email;

  User(
      {required this.avatar,
      required this.firstName,
      required this.lastName,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        avatar: json['avatar'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email']);
  }
}
