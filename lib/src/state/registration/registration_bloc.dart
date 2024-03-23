
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/models/login.dart';

import 'package:mfema_chat/src/services/login_service.dart';

part 'registration_event.dart';
part 'registration_state.dart';



class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final LoginService loginService = LoginService();

  RegistrationBloc() : super(RegistrationInitialState()) {
    on<RegistrationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(RegistrationLoadingState(isLoading: true));
      try {
        final User? user =
        await loginService.login(Login(email: event.email, password: event.password));
        if (user != null) {
          emit(RegistrationSuccessState(user));
        } else {
          emit(const RegistrationFailureState('Failed to authenticate user'));
        }
      } catch (e) {
        print(e.toString());
        emit(const RegistrationFailureState('Error occurred whilst authenticating user'));
      }
      emit(RegistrationLoadingState(isLoading: false));
    });
  }
}