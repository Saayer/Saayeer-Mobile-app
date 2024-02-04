/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/gifs/error.gif
  AssetGenImage get error => const AssetGenImage('assets/gifs/error.gif');

  /// File path: assets/gifs/squishy_logo.gif
  AssetGenImage get squishyLogo =>
      const AssetGenImage('assets/gifs/squishy_logo.gif');

  /// File path: assets/gifs/success.gif
  AssetGenImage get success => const AssetGenImage('assets/gifs/success.gif');

  /// File path: assets/gifs/tenbyten_logo.gif
  AssetGenImage get tenbytenLogo =>
      const AssetGenImage('assets/gifs/tenbyten_logo.gif');

  /// List of all assets
  List<AssetGenImage> get values => [error, squishyLogo, success, tenbytenLogo];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_logo.png
  AssetGenImage get icLogo => const AssetGenImage('assets/icons/ic_logo.png');

  /// File path: assets/icons/ic_logo_text.png
  AssetGenImage get icLogoText =>
      const AssetGenImage('assets/icons/ic_logo_text.png');

  /// File path: assets/icons/ic_logo_with_bg.jpg
  AssetGenImage get icLogoWithBg =>
      const AssetGenImage('assets/icons/ic_logo_with_bg.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [icLogo, icLogoText, icLogoWithBg];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo_text_with_bg.jpeg
  AssetGenImage get logoTextWithBg =>
      const AssetGenImage('assets/images/logo_text_with_bg.jpeg');

  /// File path: assets/images/logo_with_text.jpeg
  AssetGenImage get logoWithText =>
      const AssetGenImage('assets/images/logo_with_text.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [logoTextWithBg, logoWithText];
}

class $AssetsStringsGen {
  const $AssetsStringsGen();

  /// File path: assets/strings/ar-EG.json
  String get arEG => 'assets/strings/ar-EG.json';

  /// File path: assets/strings/en-US.json
  String get enUS => 'assets/strings/en-US.json';

  /// List of all assets
  List<String> get values => [arEG, enUS];
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsStringsGen strings = $AssetsStringsGen();
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
