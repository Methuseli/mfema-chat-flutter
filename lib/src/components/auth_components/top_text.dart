import 'package:flutter/material.dart';
import 'package:mfema_chat/src/helper_functions.dart';

class TopText extends StatefulWidget {
  final Animation<Offset> animation;
  final String pageTitle;
  const TopText({super.key, required this.animation, required this.pageTitle});

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
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
      child: Text(widget.pageTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.blueGrey),
      ),
    );
  }
}