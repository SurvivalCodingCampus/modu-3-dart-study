class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final UserAddress address;
  final String phone;
  final String website;
  final UserCompany company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    address: UserAddress.fromJson(json['address']),
    phone: json['phone'],
    website: json['website'],
    company: UserCompany.fromJson(json['company']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address.toJson(),
    'phone': phone,
    'website': website,
    'company': company.toJson(),
  };

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    UserAddress? address,
    String? phone,
    String? website,
    UserCompany? company,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    username: username ?? this.username,
    email: email ?? this.email,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    website: website ?? this.website,
    company: company ?? this.company,
  );

  @override
  String toString() =>
      'User(id: $id, name: $name, username: $username, email: $email)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          address == other.address &&
          phone == other.phone &&
          website == other.website &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;
}

// User 하위 필드 Geo
class UserGeo {
  final double lat;
  final double lng;

  const UserGeo({required this.lat, required this.lng});

  factory UserGeo.fromJson(Map<String, dynamic> json) => UserGeo(
    lat: double.parse(json['lat'].toString()),
    lng: double.parse(json['lng'].toString()),
  );

  Map<String, dynamic> toJson() => {
    'lat': lat.toString(),
    'lng': lng.toString(),
  };

  UserGeo copyWith({double? lat, double? lng}) =>
      UserGeo(lat: lat ?? this.lat, lng: lng ?? this.lng);

  @override
  String toString() => 'UserGeo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGeo && lat == other.lat && lng == other.lng;

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

// User 하위 필드 Address
class UserAddress {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final UserGeo geo;

  const UserAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
    street: json['street'],
    suite: json['suite'],
    city: json['city'],
    zipcode: json['zipcode'],
    geo: UserGeo.fromJson(json['geo']),
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city,
    'zipcode': zipcode,
    'geo': geo.toJson(),
  };

  UserAddress copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    UserGeo? geo,
  }) => UserAddress(
    street: street ?? this.street,
    suite: suite ?? this.suite,
    city: city ?? this.city,
    zipcode: zipcode ?? this.zipcode,
    geo: geo ?? this.geo,
  );

  @override
  String toString() =>
      'UserAddress(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAddress &&
          street == other.street &&
          suite == other.suite &&
          city == other.city &&
          zipcode == other.zipcode &&
          geo == other.geo;

  @override
  int get hashCode =>
      street.hashCode ^
      suite.hashCode ^
      city.hashCode ^
      zipcode.hashCode ^
      geo.hashCode;
}

// User 하위 필드 Company
class UserCompany {
  final String name;
  final String catchPhrase;
  final String bs;

  const UserCompany({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) => UserCompany(
    name: json['name'],
    catchPhrase: json['catchPhrase'],
    bs: json['bs'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };

  UserCompany copyWith({String? name, String? catchPhrase, String? bs}) =>
      UserCompany(
        name: name ?? this.name,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs,
      );

  @override
  String toString() =>
      'UserCompany(name: $name, catchPhrase: $catchPhrase, bs: $bs)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCompany &&
          name == other.name &&
          catchPhrase == other.catchPhrase &&
          bs == other.bs;

  @override
  int get hashCode => name.hashCode ^ catchPhrase.hashCode ^ bs.hashCode;
}
