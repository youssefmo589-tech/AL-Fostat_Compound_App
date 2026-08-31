// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/Lotties/empty.json
  String get empty => 'assets/Lotties/empty.json';

  /// List of all assets
  List<String> get values => [empty];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [poppinsMedium, poppinsRegular, poppinsSemiBold];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/googleimage.svg
  SvgGenImage get googleimage =>
      const SvgGenImage('assets/icons/googleimage.svg');

  /// File path: assets/icons/moon-svgrepo-com.svg
  SvgGenImage get moonSvgrepoCom =>
      const SvgGenImage('assets/icons/moon-svgrepo-com.svg');

  /// List of all assets
  List<SvgGenImage> get values => [googleimage, moonSvgrepoCom];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/AchieveMentLight.png
  AssetGenImage get achieveMentLight =>
      const AssetGenImage('assets/images/AchieveMentLight.png');

  /// File path: assets/images/AchievementBlack.png
  AssetGenImage get achievementBlack =>
      const AssetGenImage('assets/images/AchievementBlack.png');

  /// File path: assets/images/MonthluLight.png
  AssetGenImage get monthluLight =>
      const AssetGenImage('assets/images/MonthluLight.png');

  /// File path: assets/images/MonthlyBlack.png
  AssetGenImage get monthlyBlack =>
      const AssetGenImage('assets/images/MonthlyBlack.png');

  /// File path: assets/images/achievementdarkgreen .png
  AssetGenImage get achievementdarkgreen =>
      const AssetGenImage('assets/images/achievementdarkgreen .png');

  /// File path: assets/images/achievementlightgreen.png
  AssetGenImage get achievementlightgreen =>
      const AssetGenImage('assets/images/achievementlightgreen.png');

  /// File path: assets/images/achievementphoto.png
  AssetGenImage get achievementphoto =>
      const AssetGenImage('assets/images/achievementphoto.png');

  /// File path: assets/images/changepass.png
  AssetGenImage get changepass =>
      const AssetGenImage('assets/images/changepass.png');

  /// File path: assets/images/complaint black.png
  AssetGenImage get complaintBlack =>
      const AssetGenImage('assets/images/complaint black.png');

  /// File path: assets/images/complaintpagelight.png
  AssetGenImage get complaintpagelight =>
      const AssetGenImage('assets/images/complaintpagelight.png');

  /// File path: assets/images/complaintwhite.png
  AssetGenImage get complaintwhite =>
      const AssetGenImage('assets/images/complaintwhite.png');

  /// File path: assets/images/fostatpage logo black.png
  AssetGenImage get fostatpageLogoBlack =>
      const AssetGenImage('assets/images/fostatpage logo black.png');

  /// File path: assets/images/fostatpagelogogreen.png
  AssetGenImage get fostatpagelogogreen =>
      const AssetGenImage('assets/images/fostatpagelogogreen.png');

  /// File path: assets/images/fostatpagelogolightgrey.png
  AssetGenImage get fostatpagelogolightgrey =>
      const AssetGenImage('assets/images/fostatpagelogolightgrey.png');

  /// File path: assets/images/fostatsplashblack-01.png
  AssetGenImage get fostatsplashblack01 =>
      const AssetGenImage('assets/images/fostatsplashblack-01.png');

  /// File path: assets/images/fostatsplashgreen-01.png
  AssetGenImage get fostatsplashgreen01 =>
      const AssetGenImage('assets/images/fostatsplashgreen-01.png');

  /// File path: assets/images/fostatsplashlightgrey-01.png
  AssetGenImage get fostatsplashlightgrey01 =>
      const AssetGenImage('assets/images/fostatsplashlightgrey-01.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/onboarding page1.png
  AssetGenImage get onboardingPage1 =>
      const AssetGenImage('assets/images/onboarding page1.png');

  /// File path: assets/images/onboarding page2.png
  AssetGenImage get onboardingPage2 =>
      const AssetGenImage('assets/images/onboarding page2.png');

  /// File path: assets/images/onboardingpage3.png
  AssetGenImage get onboardingpage3 =>
      const AssetGenImage('assets/images/onboardingpage3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    achieveMentLight,
    achievementBlack,
    monthluLight,
    monthlyBlack,
    achievementdarkgreen,
    achievementlightgreen,
    achievementphoto,
    changepass,
    complaintBlack,
    complaintpagelight,
    complaintwhite,
    fostatpageLogoBlack,
    fostatpagelogogreen,
    fostatpagelogolightgrey,
    fostatsplashblack01,
    fostatsplashgreen01,
    fostatsplashlightgrey01,
    google,
    onboardingPage1,
    onboardingPage2,
    onboardingpage3,
  ];
}

abstract final class Assets {
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
