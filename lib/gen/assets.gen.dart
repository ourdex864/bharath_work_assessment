/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/activity.svg
  String get activity => 'assets/icons/activity.svg';

  /// File path: assets/icons/add.svg
  String get add => 'assets/icons/add.svg';

  /// File path: assets/icons/bookmark.svg
  String get bookmark => 'assets/icons/bookmark.svg';

  /// File path: assets/icons/bookmarks.svg
  String get bookmarks => 'assets/icons/bookmarks.svg';

  /// File path: assets/icons/comments.svg
  String get comments => 'assets/icons/comments.svg';

  /// File path: assets/icons/create_item.png
  AssetGenImage get createItem =>
      const AssetGenImage('assets/icons/create_item.png');

  /// File path: assets/icons/discover.svg
  String get discover => 'assets/icons/discover.svg';

  /// File path: assets/icons/forward.svg
  String get forward => 'assets/icons/forward.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/play.svg
  String get play => 'assets/icons/play.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/save.svg
  String get save => 'assets/icons/save.svg';

  /// File path: assets/icons/symbol.svg
  String get symbol => 'assets/icons/symbol.svg';

  /// File path: assets/icons/union.svg
  String get union => 'assets/icons/union.svg';

  /// List of all assets
  List<dynamic> get values => [
        activity,
        add,
        bookmark,
        bookmarks,
        comments,
        createItem,
        discover,
        forward,
        heart,
        home,
        play,
        profile,
        save,
        symbol,
        union
      ];
}

class Assets {
  Assets._();

  static const AssetGenImage appBg = AssetGenImage('assets/app_bg.png');
  static const $AssetsIconsGen icons = $AssetsIconsGen();

  /// List of all assets
  List<AssetGenImage> get values => [appBg];
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
