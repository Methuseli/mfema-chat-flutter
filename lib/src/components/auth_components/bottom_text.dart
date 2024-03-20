import 'package:flutter/material.dart';
import 'package:mfema_chat/src/helper_functions.dart';

import 'package:mfema_chat/src/constants.dart';
import 'package:mfema_chat/src/screens/login_screen.dart';
import 'package:mfema_chat/src/screens/registration_screen.dart';

class BottomText extends StatefulWidget {
  final Animation<Offset> animation;
  final String linkText;
  final String promptText;
  final String page;
  const BottomText(
      {super.key,
      required this.animation,
      required this.linkText,
      required this.promptText,
      required this.page,});

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  void initState() {
    widget.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: widget.animation,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              if(widget.page == 'registration'){
                return const LoginScreen();
              }
              return const RegisterScreen();
            },
          ),
        ),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
              children: [
                TextSpan(
                  text: widget.promptText,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: widget.linkText,
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
