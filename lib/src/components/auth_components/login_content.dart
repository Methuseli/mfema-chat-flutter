import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mfema_chat/src/forms/form_controller.dart';
import 'package:mfema_chat/src/helper_functions.dart';

import 'package:mfema_chat/src/constants.dart';
import 'package:mfema_chat/src/animations/login_screen_animation.dart';
import 'package:mfema_chat/src/state/authentication_bloc.dart';
import 'bottom_text.dart';
import 'top_text.dart';
import 'form_widgets.dart';

enum Screens {
  login,
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> loginContent;
  final Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
  };

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

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

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email.';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password.';
    }
    return null;
  }

  void saveEmail(String value) {
    _formData['email'] = value;
  }

  void savePassword(String value) {
    _formData['password'] = value;
  }


  // TO DO
  // Fix the login service

  void onSubmit() {
    BlocProvider.of<AuthenticationBloc>(context).add(
      SignUpUser(_formData['email'], _formData['password']), // Replace with actual email and password
    );
  }

  @override
  void initState() {
    loginContent = [
      inputField(
          'Email', Ionicons.mail_outline, false, validateEmail, saveEmail),
      inputField('Password', Ionicons.lock_closed_outline, true,
          validatePassword, savePassword),
      actionButton('Log In', onSubmit),
      forgotPassword(),
    ];

    LoginScreenAnimation.initialize(
      vsync: this,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: LoginScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    LoginScreenAnimation.dispose();

    super.dispose();
  }

  late FormController loginFormController = FormController(
      widgets: loginContent, onValidate: (isValid) {}, onSubmit: (formData) {});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 50),
            child: TopText(
              animation: LoginScreenAnimation.topTextAnimation,
              pageTitle: 'Welcome back!',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: BottomText(
                animation: LoginScreenAnimation.bottomTextAnimation,
                linkText: 'Sign Up',
                promptText: 'Don\'t have an account? ',
                page: 'login',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
