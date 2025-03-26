//직렬화

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }
}
