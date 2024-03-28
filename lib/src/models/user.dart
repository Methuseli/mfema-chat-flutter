class User {
  final String id, username, email, password, firstname, lastname;
  final String? middlename, description, profileImageUrl, phoneNumber;
  final DateTime created;
  final List<Role> roles;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.firstname,
      this.middlename,
      required this.lastname,
      required this.created,
      required this.roles,
      this.profileImageUrl,
      this.description,
      this.phoneNumber,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']!,
      username: json['username']!,
      email: json['email']!,
      password: json['password']!,
      firstname: json['firstname']!,
      middlename: json['middlename'] as String?,
      lastname: json['lastname']!,
      created: DateTime.fromMicrosecondsSinceEpoch((json['created']! * Duration.microsecondsPerSecond).round()),
      roles: json['roles'] != null
          ? (json['roles'] as List)
              .map((roleJson) => Role.fromJson(roleJson))
              .toList()
          : [],
      profileImageUrl: json['profile_image_url'] as String?,
      description: json['description'] as String?,
      phoneNumber: json['phone_number'],
    );
  }
}

class RegisterUser {
  final String username, email, password, firstname, lastname;
  final String? middlename, description, profileImageUrl, phoneNumber;
  final List<Role> roles;

  RegisterUser(
      {required this.username,
      required this.email,
      required this.password,
      required this.firstname,
      this.middlename,
      required this.lastname,
      required this.roles,
      this.description,
      this.profileImageUrl,
      this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'firstname': firstname,
      'middlename': middlename,
      'lastname': lastname,
      'roles': roles,
      'description': description,
      'profile_image_url': profileImageUrl,
      'phone_number': phoneNumber,
    };
  }

}

class Role {
  final String? name;
  final String id;

  Role({this.name, required this.id});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(id: json['id']!, name: json['name'] as String?);
  }
}

class Profile {
  final String? description, profileImageUrl;

  Profile({this.description, this.profileImageUrl});
}
