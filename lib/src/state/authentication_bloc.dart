
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/models/login.dart';

import 'package:mfema_chat/src/services/login_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginService loginService = LoginService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final User? user =
        await loginService.login(Login(email: event.email, password: event.password));
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('Failed to authenticate user'));
        }
      } catch (e) {
        print(e.toString());
        emit(const AuthenticationFailureState('Error occurred whilst authenticating user'));
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}