class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final catchPhrase = json['catchPhrase'] as String;
    final bs = json['bs'] as String;
    return Company(name: name, catchPhrase: catchPhrase, bs: bs);
  }

  @override
  String toString() => 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }
}
