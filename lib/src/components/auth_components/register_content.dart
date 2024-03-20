import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mfema_chat/src/helper_functions.dart';

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

  @override
  void initState() {
    personalInfoContent = [
      inputField('First Name', Ionicons.person_outline, false),
      inputField('Middle Name', Ionicons.person_outline, false),
      inputField('Last Name', Ionicons.person_outline, false),
      inputField('Email', Ionicons.mail_outline, false),
      inputField('Phone Number', Ionicons.cellular_outline, false),
      actionButton('Continue'),
      orDivider(),
      logos(),
    ];

    profileInfoContent = [
      multipleLineInputField("Description", Ionicons.book_outline),
      fileInput("Profile Image", Ionicons.cloud_upload_outline, false),
      actionButton('Register'),
    ];

    passwordConfirmContent = [
      inputField('Password', Ionicons.lock_closed_outline, true),
      inputField('Confirm Password', Ionicons.lock_closed_outline, true),
      actionButton('Conitnue'),
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
