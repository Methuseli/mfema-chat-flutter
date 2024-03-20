import 'package:flutter/material.dart';

import 'package:mfema_chat/src/components/auth_components/register_content.dart';

class RegistrationScreenAnimation {
  static late AnimationController topTextController;
  static late Animation<Offset> topTextAnimation;

  static late AnimationController bottomTextController;
  static late Animation<Offset> bottomTextAnimation;

  static final List<AnimationController> personalInfoControllers = [];
  static final List<Animation<Offset>> personalInfoAnimations = [];

  static final List<AnimationController> profileInfoControllers = [];
  static final List<Animation<Offset>> profileInfoAnimations = [];

  static final List<AnimationController> passwordConfirmControllers = [];
  static final List<Animation<Offset>> passwordConfirmAnimations = [];

  static var isPlaying = false;
  static var currentScreen = Screens.personalInfo;

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
    required int personalInfoItems,
    required int profileInfoItems,
    required int passwordConfirmItems,
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

    for (var i = 0; i < personalInfoItems; i++) {
      personalInfoControllers.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );

      personalInfoAnimations.add(
        _createAnimation(
          begin: Offset.zero,
          end: const Offset(-1, 0),
          parent: personalInfoControllers[i],
        ),
      );
    }

    for (var i = 0; i < profileInfoItems; i++) {
      profileInfoControllers.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );

      profileInfoAnimations.add(
        _createAnimation(
          begin: const Offset(2, 0),
          end: Offset.zero,
          parent: profileInfoControllers[i],
        ),
      );
    }

    for (var i = 0; i < passwordConfirmItems; i++) {
      passwordConfirmControllers.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );

      passwordConfirmAnimations.add(
        _createAnimation(
          begin: const Offset(2, 0),
          end: const Offset(-1, 0),
          parent: passwordConfirmControllers[i],
        ),
      );
    }
  }

  static void dispose() {
    for (final controller in [
      topTextController,
      bottomTextController,
      ...personalInfoControllers,
      ...profileInfoControllers,
      ...passwordConfirmControllers,
    ]) {
      controller.dispose();
    }
  }

  static Future<void> forward() async {
    isPlaying = true;

    topTextController.forward();
    await bottomTextController.forward();

    for (final controller in [
      ...personalInfoControllers,
      ...profileInfoControllers,
      ...passwordConfirmControllers,
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
      ...profileInfoControllers.reversed,
      ...personalInfoControllers.reversed,
      ...passwordConfirmControllers.reversed,
    ]) {
      controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextController.reverse();
    await topTextController.reverse();

    isPlaying = false;
  }
}