
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/models/login.dart';

import 'package:mfema_chat/src/services/login_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginService loginService = LoginService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<LogInUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final http.Response? response = await loginService.login(Login(email: event.email, password: event.password));
        print('Response $response');
        if (response != null) {
          if(response.statusCode == 200) {
            final User user = User.fromJson(jsonDecode(response.body));
            emit(AuthenticationSuccessState(user));
          } else {
            emit(AuthenticationFailureState(response.body));
          }

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