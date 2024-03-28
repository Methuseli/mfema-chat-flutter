
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mfema_chat/src/models/user.dart';
import 'package:mfema_chat/src/services/registration_service.dart';

part 'registration_event.dart';
part 'registration_state.dart';



class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationService registrationService = RegistrationService();

  RegistrationBloc() : super(RegistrationInitialState()) {
    on<RegistrationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(RegistrationLoadingState(isLoading: true));
      try {
        final http.Response? response = await registrationService.register(RegisterUser(username: event.username, email: event.email, password: event.password, firstname: event.firstname, middlename: event.middlename, lastname: event.lastname, roles: event.roles, description: event.description, profileImageUrl: event.profileImageUrl, phoneNumber: event.phoneNumber));
        if (response != null) {
          if (response.statusCode == 200){
            final User user = User.fromJson(jsonDecode(response.body));
            emit(RegistrationSuccessState(user));
          } else {
            emit(RegistrationFailureState(response.body));
          }

        } else {
          emit(const RegistrationFailureState('Failed to register user'));
        }
      } catch (e) {
        print(e.toString());
        emit(const RegistrationFailureState('Error occurred whilst registering user'));
      }
      emit(RegistrationLoadingState(isLoading: false));
    });
  }
}