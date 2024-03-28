import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfema_chat/src/forms/flutter_form_controller.dart';
import 'package:mfema_chat/src/forms/registration_form.dart';
import 'package:mfema_chat/src/screens/login_screen.dart';
import 'package:mfema_chat/src/state/registration/registration_bloc.dart';
import 'package:mfema_chat/src/util/constants.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  bool _isBlurred = false;

  void onSubmit(Map<String, dynamic> data) {
    BlocProvider.of<RegistrationBloc>(context).add(SignUpUser(
        data['email']!,
        data['password']!,
        data['username']!,
        data['firstname']!,
        data['lastname']!,
        data['middlename'],
        data['description'],
        data['profileImageUrl'],
        [],
        data['phoneNumber']));
  }

  late FormController registrationFormController = FormController(
      widgets: registrationForm, onValidate: (isValid) {}, onSubmit: onSubmit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (context) => RegistrationBloc(),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationLoadingState) {
            setState(() {
              _isBlurred = state.isLoading;
            });
          } else if (state is RegistrationSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          } else if (state is RegistrationFailureState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.errorMessage),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 5),
                      child: Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: registrationFormController,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          ),
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Log In',
                                        style: TextStyle(
                                          color: kSecondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isBlurred)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
