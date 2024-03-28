part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();

  List<Object> get props => [];
}

class SignUpUser extends RegistrationEvent {
  final String username, email, password, firstname, lastname;
  final String? middlename, description, profileImageUrl, phoneNumber;
  final List<Role> roles;

  const SignUpUser(
      this.email,
      this.password,
      this.username,
      this.firstname,
      this.lastname,
      this.middlename,
      this.description,
      this.profileImageUrl,
      this.roles,
      this.phoneNumber);

  @override
  List<Object> get props => [email, password];
}
