class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json['name'] ?? '',
    catchPhrase: json['catchPhrase'] ?? '',
    bs: json['bs'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };
}
