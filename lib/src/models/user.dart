class User {
  final String id, username, email, password, firstname, lastname;
  final String? middlename, description, profileImageUrl;
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
      required this.profileImageUrl,
      required this.description});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']!,
      username: json['username']!,
      email: json['email']!,
      password: json['password']!,
      firstname: json['firstname']!,
      middlename: json['middlename'] as String?,
      lastname: json['lastname']!,
      created: json['created']!,
      roles: json['roles'] != null
          ? (json['roles'] as List)
              .map((roleJson) => Role.fromJson(roleJson))
              .toList()
          : [],
      profileImageUrl: json['profile_image_url'] as String?,
      description: json['description'] as String?,
    );
  }
}

class RegisterUser {
  final String username, email, password, firstname, lastname;
  final String? middlename, description, profileImageUrl;
  final List<Role> roles;

  RegisterUser(
      {required this.username,
      required this.email,
      required this.password,
      required this.firstname,
      this.middlename,
      required this.lastname,
      required this.roles,
      required this.description,
      required this.profileImageUrl});

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
