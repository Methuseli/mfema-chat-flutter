/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Logo_dark.png
  AssetGenImage get logoDark =>
      const AssetGenImage('assets/images/Logo_dark.png');

  /// File path: assets/images/Logo_light.png
  AssetGenImage get logoLight =>
      const AssetGenImage('assets/images/Logo_light.png');

  /// File path: assets/images/Video Place Here.png
  AssetGenImage get videoPlaceHere =>
      const AssetGenImage('assets/images/Video Place Here.png');

  /// File path: assets/images/chat.png
  AssetGenImage get chat => const AssetGenImage('assets/images/chat.png');

  /// File path: assets/images/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/images/facebook.png');

  /// File path: assets/images/flutter_logo.png
  AssetGenImage get flutterLogo =>
      const AssetGenImage('assets/images/flutter_logo.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/mfema-chat-high-resolution-logo-black-transparent.png
  AssetGenImage get mfemaChatHighResolutionLogoBlackTransparent =>
      const AssetGenImage(
          'assets/images/mfema-chat-high-resolution-logo-black-transparent.png');

  /// File path: assets/images/mfema-chat-high-resolution-logo-transparent.png
  AssetGenImage get mfemaChatHighResolutionLogoTransparent =>
      const AssetGenImage(
          'assets/images/mfema-chat-high-resolution-logo-transparent.png');

  /// File path: assets/images/mfema-chat-high-resolution-logo-white-transparent.png
  AssetGenImage get mfemaChatHighResolutionLogoWhiteTransparent =>
      const AssetGenImage(
          'assets/images/mfema-chat-high-resolution-logo-white-transparent.png');

  /// File path: assets/images/mfema-chat-high-resolution-logo.png
  AssetGenImage get mfemaChatHighResolutionLogo =>
      const AssetGenImage('assets/images/mfema-chat-high-resolution-logo.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/user_2.png
  AssetGenImage get user2 => const AssetGenImage('assets/images/user_2.png');

  /// File path: assets/images/user_3.png
  AssetGenImage get user3 => const AssetGenImage('assets/images/user_3.png');

  /// File path: assets/images/user_4.png
  AssetGenImage get user4 => const AssetGenImage('assets/images/user_4.png');

  /// File path: assets/images/user_5.png
  AssetGenImage get user5 => const AssetGenImage('assets/images/user_5.png');

  /// File path: assets/images/welcome_image.png
  AssetGenImage get welcomeImage =>
      const AssetGenImage('assets/images/welcome_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        logoDark,
        logoLight,
        videoPlaceHere,
        chat,
        facebook,
        flutterLogo,
        google,
        mfemaChatHighResolutionLogoBlackTransparent,
        mfemaChatHighResolutionLogoTransparent,
        mfemaChatHighResolutionLogoWhiteTransparent,
        mfemaChatHighResolutionLogo,
        user,
        user2,
        user3,
        user4,
        user5,
        welcomeImage
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
