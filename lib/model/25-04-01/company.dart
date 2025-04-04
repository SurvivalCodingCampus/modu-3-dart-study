class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company(this.name, this.catchPhrase, this.bs);

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      json['name'],
      json['catchPhrase'],
      json['bs'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'catchPhrase': catchPhrase,
        'bs': bs,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Company && runtimeType == other.runtimeType &&
              name == other.name && catchPhrase == other.catchPhrase &&
              bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;

  @override
  String toString() => 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

}