import 'package:mfema_chat/src/components/primary_button.dart';
import 'package:mfema_chat/src/constants.dart';
import 'package:mfema_chat/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/mfema-chat-high-resolution-logo-transparent.png"
                    : "assets/images/mfema-chat-high-resolution-logo-black-transparent.png",
                height: 146,
              ),
              const Spacer(),
              PrimaryButton(
                text: "Log in",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Register",
                press: () {},
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
