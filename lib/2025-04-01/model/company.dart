class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Company copyWith({String? name, String? catchPhrase, String? bs}) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String? ?? '',
      catchPhrase: json['catchPhrase'] as String? ?? '',
      bs: json['bs'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Company &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          catchPhrase == other.catchPhrase &&
          bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  @override
  String toString() {
    return 'Company{name: $name, catchPhrase: $catchPhrase, bs: $bs}';
  }
}
