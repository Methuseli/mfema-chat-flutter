import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfema_chat/src/forms/flutter_form_controller.dart';
import 'package:mfema_chat/src/forms/login_form.dart';
import 'package:mfema_chat/src/screens/chats_screen.dart';
import 'package:mfema_chat/src/screens/registration_screen.dart';

import 'package:mfema_chat/src/util/constants.dart';
import 'package:mfema_chat/src/state/authentication/authentication_bloc.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool _isBlurred = false;

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/facebook.png'),
          const SizedBox(width: 24),
          Image.asset('assets/images/google.png'),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  void onSubmit(Map<String, dynamic> data) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      LogInUser(data['email']!,
          data['password']!), // Replace with actual email and password
    );
  }

  late FormController loginFormController = FormController(
      widgets: loginForm,
      onValidate: (isValid) {
        if (!isValid) {}
      },
      onSubmit: onSubmit);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
      if (state is AuthenticationLoadingState) {
        setState(() {
          _isBlurred = state.isLoading;
        });
      } else if (state is AuthenticationSuccessState) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ChatsScreen();
            },
          ),
        );
      } else if (state is AuthenticationFailureState) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errorMessage),
              );
            });
      }
    }, builder: (context, state) {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 50),
                  child: Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [loginFormController],
                    )
                  ]),
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
                            return const RegisterScreen();
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
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Sign Up',
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
    });
  }
}
