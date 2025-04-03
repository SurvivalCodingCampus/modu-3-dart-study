class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final catchPhrase = json['catchPhrase'] as String;
    final bs = json['bs'] as String;
    return Company(name: name, catchPhrase: catchPhrase, bs: bs);
  }
}
