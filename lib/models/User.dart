// ignore: file_names
class User {
  final int? id;
  final String phoneNumber;
  final String password;

  const User({this.id, required this.phoneNumber, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'phoneNumber': String phoneNumber,
        'password': String password
      } =>
        User(id: id, phoneNumber: phoneNumber, password: password),
      _ => throw const FormatException('Failed to load User'),
    };
  }
}
