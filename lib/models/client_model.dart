import 'dart:convert';

class Client {
  final String id;
  final String name;
  final String phone;
  final String location;
  final String email;
  final String password;
  final String role;
  Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.email,
    required this.password,
    required this.role,
  });

  Client copyWith({
    String? id,
    String? name,
    String? phone,
    String? location,
    String? email,
    String? password,
    String? role,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'location': location,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      location: map['location'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Client(id: $id, name: $name, phone: $phone, location: $location, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(covariant Client other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.location == location &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        location.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode;
  }
}
