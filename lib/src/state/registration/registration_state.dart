part of 'registration_bloc.dart';


abstract class RegistrationState {
  const RegistrationState();

  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {
  final bool isLoading;

  RegistrationLoadingState({required this.isLoading});
}

class RegistrationSuccessState extends RegistrationState {
  final User user;

  const RegistrationSuccessState(this.user);
  @override
  List<Object> get props => [user];
}
class RegistrationFailureState extends RegistrationState {
  final String errorMessage;

  const RegistrationFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}