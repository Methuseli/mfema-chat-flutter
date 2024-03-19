class User {
  final String? id, username, email, password, firstname, middlename, lastname;
  final DateTime? created;
  final List<Role> roles;

  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.firstname,
      this.middlename,
      this.lastname,
      this.created,
      required this.roles});
}

class RegisterUser {
  final String? username, email, password, firstname, middlename, lastname;
  final List<Role> roles;

  RegisterUser(
      {this.username,
      this.email,
      this.password,
      this.firstname,
      this.middlename,
      this.lastname,
      required this.roles});
}

class Role {
  final String? name, id;

  Role({this.name, this.id});
}
