import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mfema_chat/src/state/registration/registration_bloc.dart';
import 'package:mfema_chat/src/util/constants.dart';
import 'package:mfema_chat/src/util/helper_functions.dart';

import 'package:mfema_chat/src/animations/registration_screen_animation.dart';
import 'bottom_text.dart';
import 'top_text.dart';
import 'form_widgets.dart';

enum Screens {
  personalInfo,
  passwordConfirm,
  profileInfo,
}

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent>
    with TickerProviderStateMixin {
  late final List<Widget> personalInfoContent;
  late final List<Widget> profileInfoContent;
  late final List<Widget> passwordConfirmContent;
  final Map<String, dynamic> _formData = {
    'firstname': '',
    'middlename': '',
    'lastname': '',
    'email': '',
    'phoneNumber': '',
    'password': '',
    'description': '',
    'profileImageUrl': '',
    'roles': [],
    'username': '',
  };

  Widget actionButton(String title, Function(Map<String, dynamic> formData) onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {onPressed(_formData);},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          backgroundColor: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Function(String) inputValidation(String field) {
    return (String value) {
      if (value.isEmpty) {
        return 'Please enter your $field';
      }
      return null;
    };
  }

  Function(String) saveInput(String field) {
    return (String value) {
      _formData[field] = value;
    };
  }

  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    final hasUppercase = RegExp(r'[A-Z]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasNumber = RegExp(r'[0-9]');
    final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!(hasUppercase.hasMatch(value) ||
        hasLowercase.hasMatch(value) ||
        hasNumber.hasMatch(value) ||
        hasSpecialCharacters.hasMatch(value) ||
        value.length >= 8)) {
      return "Password must have at least one uppercase\n, one lower case\n, one number\n, one special character (!@#\$%^&*(),.?\":{}|<>), \nand must be at least 8 characters!!!";
    }
    return null;
  }

  String? confirmPassword(String value) {
    if (value != _formData['password']) {
      return "Password do not match";
    }
    return null;
  }

  void personalInfoContinue() {
    // if (!RegistrationScreenAnimation.isPlaying) {

    // }
    if (_formData['firstname'].toString().isNotEmpty &&
        _formData['middlename'].toString().isNotEmpty &&
        _formData['lastname'].toString().isNotEmpty &&
        _formData['email'].toString().isNotEmpty &&
        _formData['phoneNumber']) {
      RegistrationScreenAnimation.forward();
    }
  }

  void passwordInfoContinue() {
    RegistrationScreenAnimation.forward();
  }

  Future<void> submitForms() async {
    if (_formData['username'].toString().isNotEmpty &&
        _formData['password'].toString().isNotEmpty) {
      BlocProvider.of<RegistrationBloc>(context).add(SignUpUser(
        _formData['email'],
        _formData['password'],
        _formData['username'],
        _formData['firstname'],
        _formData['lastname'],
        _formData['middlename'],
        _formData['description'],
        _formData['profileImageUrl'],
        _formData['roles'],
        _formData['phoneNumber'],
      ));
    }
  }

  @override
  void initState() {
    personalInfoContent = [
      inputField('First Name', Ionicons.person_outline, false,
          inputValidation('firstname'), saveInput('firstname')),
      inputField('Middle Name', Ionicons.person_outline, false,
          inputValidation('middlename'), saveInput('middlename')),
      inputField('Last Name', Ionicons.person_outline, false,
          inputValidation('lastname'), saveInput('lastname')),
      inputField('Email', Ionicons.mail_outline, false,
          inputValidation('email'), saveInput('email')),
      inputField('Phone Number', Ionicons.cellular_outline, false,
          inputValidation('phoneNumber'), saveInput('phoneNumber')),
      // actionButton('Continue', personalInfoContinue),
      orDivider(),
      logos(),
    ];

    profileInfoContent = [
      multipleLineInputField("Description", Ionicons.book_outline),
      fileInput("Profile Image", Ionicons.cloud_upload_outline, false),
      // actionButton('Register', submitForms),
    ];

    passwordConfirmContent = [
      inputField('Username', Ionicons.lock_closed_outline, true,
          inputValidation('firstname'), saveInput('firstname')),
      inputField('Password', Ionicons.lock_closed_outline, true,
          passwordValidation, saveInput('password')),
      inputField('Confirm Password', Ionicons.lock_closed_outline, true,
          confirmPassword, saveInput('password')),
      // actionButton('Continue', passwordInfoContinue),
    ];

    RegistrationScreenAnimation.initialize(
      vsync: this,
      personalInfoItems: personalInfoContent.length,
      profileInfoItems: profileInfoContent.length,
      passwordConfirmItems: passwordConfirmContent.length,
    );

    for (var i = 0; i < personalInfoContent.length; i++) {
      personalInfoContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: RegistrationScreenAnimation.personalInfoAnimations[i],
        child: personalInfoContent[i],
      );
    }

    for (var i = 0; i < profileInfoContent.length; i++) {
      profileInfoContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: RegistrationScreenAnimation.profileInfoAnimations[i],
        child: profileInfoContent[i],
      );
    }

    for (var i = 0; i < passwordConfirmContent.length; i++) {
      passwordConfirmContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: RegistrationScreenAnimation.passwordConfirmAnimations[i],
        child: passwordConfirmContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    RegistrationScreenAnimation.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 50),
          child: TopText(
            animation: RegistrationScreenAnimation.topTextAnimation,
            pageTitle: 'Create Account',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: personalInfoContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: passwordConfirmContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: profileInfoContent,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: BottomText(
              animation: RegistrationScreenAnimation.bottomTextAnimation,
              linkText: 'Login',
              promptText: 'Already have an account? ',
              page: 'registration',
            ),
          ),
        ),
      ],
    ));
  }
}
