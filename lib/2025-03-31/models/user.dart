class Geo {
  final double? lat;
  final double? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Geo();
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
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Address();
    return Address(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (street != null) json['street'] = street;
    if (suite != null) json['suite'] = suite;
    if (city != null) json['city'] = city;
    if (zipcode != null) json['zipcode'] = zipcode;
    if (geo != null) json['geo'] = geo!.toJson();
    return json;
  }
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Company();
    return Company(
      name: json['name'] as String?,
      catchPhrase: json['catchPhrase'] as String?,
      bs: json['bs'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) json['name'] = name;
    if (catchPhrase != null) json['catchPhrase'] = catchPhrase;
    if (bs != null) json['bs'] = bs;
    return json;
  }
}

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  final Address? address;
  final Company? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      company: json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (username != null) json['username'] = username;
    if (email != null) json['email'] = email;
    if (phone != null) json['phone'] = phone;
    if (website != null) json['website'] = website;
    if (address != null) json['address'] = address!.toJson();
    if (company != null) json['company'] = company!.toJson();
    return json;
  }

  void debugPrint() {
    print(
      'User { id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website, city: ${address?.city}, company: ${company?.name} }',
    );
    print('========================================');
  }
}
