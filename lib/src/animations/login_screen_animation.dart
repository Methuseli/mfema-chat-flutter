import 'package:flutter/material.dart';

import 'package:mfema_chat/src/components/auth_components/login_content.dart';

class LoginScreenAnimation {
  static late AnimationController topTextController;
  static late Animation<Offset> topTextAnimation;

  static late AnimationController bottomTextController;
  static late Animation<Offset> bottomTextAnimation;

  static final List<AnimationController> loginControllers = [];
  static final List<Animation<Offset>> loginAnimations = [];

  static var isPlaying = false;
  static var currentScreen = Screens.login;

  static Animation<Offset> _createAnimation({
    required Offset begin,
    required Offset end,
    required AnimationController parent,
  }) {
    return Tween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.easeInOut,
      ),
    );
  }

  static void initialize({
    required TickerProvider vsync,
    required int loginItems,
  }) {
    topTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );

    topTextAnimation = _createAnimation(
      begin: Offset.zero,
      end: const Offset(-1.2, 0),
      parent: topTextController,
    );

    bottomTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );

    bottomTextAnimation = _createAnimation(
      begin: Offset.zero,
      end: const Offset(0, 1.7),
      parent: bottomTextController,
    );
    // print('Log in items $loginItems');

    for (var i = 0; i < loginItems; i++) {
      loginControllers.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );

      loginAnimations.add(
        _createAnimation(
          begin: Offset.zero,
          end: const Offset(-1, 0),
          parent: loginControllers[i],
        ),
      );
    }
  }

  static void dispose() {
    for (final controller in [
      topTextController,
      bottomTextController,
      ...loginControllers,
    ]) {
      controller.dispose();
    }
  }

  static Future<void> forward() async {
    isPlaying = true;

    topTextController.forward();
    await bottomTextController.forward();

    for (final controller in [
      ...loginControllers,
    ]) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextController.reverse();
    await topTextController.reverse();

    isPlaying = false;
  }

  static Future<void> reverse() async {
    isPlaying = true;

    topTextController.forward();
    await bottomTextController.forward();

    for (final controller in [
      ...loginControllers.reversed,
    ]) {
      controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextController.reverse();
    await topTextController.reverse();

    isPlaying = false;
  }
}