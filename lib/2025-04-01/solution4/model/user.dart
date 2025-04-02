class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map address;
  final String phone;
  final String webSite;
  final Map company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.webSite,
    required this.company,
  });

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Map? address,
    String? phone,
    String? webSite,
    Map? company,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (username == null || identical(username, this.username)) &&
        (email == null || identical(email, this.email)) &&
        (address == null || identical(address, this.address)) &&
        (phone == null || identical(phone, this.phone)) &&
        (webSite == null || identical(webSite, this.webSite)) &&
        (company == null || identical(company, this.company))) {
      return this;
    }

    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      webSite: webSite ?? this.webSite,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address,
      'phone': phone,
      'webSite': webSite,
      'company': company,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      address: map['address'] as Map,
      phone: map['phone'] as String,
      webSite: map['webSite'] as String,
      company: map['company'] as Map,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, webSite: $webSite, company: $company}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          address == other.address &&
          phone == other.phone &&
          webSite == other.webSite &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      webSite.hashCode ^
      company.hashCode;
}
