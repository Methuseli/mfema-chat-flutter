part of 'authentication_bloc.dart';



abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];

}

class LogInUser extends AuthenticationEvent {
  final String email;
  final String password;

  const LogInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}