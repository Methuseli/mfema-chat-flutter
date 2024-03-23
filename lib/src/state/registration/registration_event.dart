part of 'registration_bloc.dart';



abstract class RegistrationEvent {
  const RegistrationEvent();

  List<Object> get props => [];

}

class SignUpUser extends RegistrationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}