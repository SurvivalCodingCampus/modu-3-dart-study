class Geo {
  final double? lat;
  final double? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic>? json) {
    // json이 null일 수 있으므로 이를 체크하고 처리
    if (json == null) {
      return Geo();
    }
    return Geo(
      lat: json['lat'] != null ? double.tryParse(json['lat'].toString()) : null,
      lng: json['lng'] != null ? double.tryParse(json['lng'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (lat != null) json['lat'] = lat;
    if (lng != null) json['lng'] = lng;
    return json;
  }
}

class Address {
  final String? street;
  final String? city;
  final Geo? geo;

  Address({this.street, this.city, this.geo});

  factory Address.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Address();
    }
    return Address(
      street: json['street'] as String?,
      city: json['city'] as String?,
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (street != null) json['street'] = street;
    if (city != null) json['city'] = city;
    if (geo != null) json['geo'] = geo!.toJson();
    return json;
  }
}

class Company {
  final String? name;

  Company({this.name});

  factory Company.fromJson(Map<String, dynamic>? json) {
    return Company(name: json?['name'] as String?);
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) json['name'] = name;
    return json;
  }
}

class User {
  final int? id;
  final String? name;
  final Address? address;
  final Company? company;

  User({this.id, this.name, this.address, this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (address != null) json['address'] = address!.toJson();
    if (company != null) json['company'] = company!.toJson();
    return json;
  }

  void debugPrint() {
    print(
      'User { id: $id, name: $name, city: ${address?.city}, company: ${company?.name} }',
    );
    print('========================================');
  }
}
