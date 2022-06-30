library nacey_flutter_tools;

export 'nacey_flutter_tools.dart'
    show
        os,
        showNaceyDialog,
        naceyModalSheet,
        isMaterial,
        isCupertino,
        isFluent,
        uiThemeData,
        MaterialModalSheetData,
        CupertinoModalSheetData,
        FluentModalSheetData,
        OS;
export 'form_validators.dart'
    show
        emailRegex,
        alphaNumericRegex,
        alphaRegex,
        numericRegex,
        hexColorRegex,
        phoneRegex,
        dateRegex,
        urlRegex;
export 'extensions/extensions.dart';
export 'theme/themes.dart' show ThemeDataExtension, CustomThemeFields;
export 'widgets/form_inputs/form_inputs.dart';
export 'widgets/widgets.dart';

import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart' as _fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as _material;

enum OS { web, android, ios, linux, mac, windows, fuchsia }

enum UIStyle { material, cupertino, fluent }

UIStyle _uiStyle(BuildContext context) {
  final os = OSWidgetProvider.of(context)?.os;
  final uiStyle = OSWidgetProvider.of(context)?.settings.uiStyle;
  if (os == null && kIsWeb) {
    return uiStyle?.web ?? UIStyle.material;
  }
  switch (os ?? _material.Theme.of(context).platform) {
    case TargetPlatform.android:
      return uiStyle?.android ?? UIStyle.material;
    case TargetPlatform.fuchsia:
      return uiStyle?.fuchsia ?? UIStyle.material;
    case TargetPlatform.iOS:
      return uiStyle?.ios ?? UIStyle.cupertino;
    case TargetPlatform.macOS:
      return uiStyle?.mac ?? UIStyle.cupertino;
    case TargetPlatform.linux:
      return uiStyle?.linux ?? UIStyle.fluent;
    case TargetPlatform.windows:
      return uiStyle?.windows ?? UIStyle.fluent;
  }
}

const Border cupNavBarBorder = Border(
  bottom: BorderSide(
    color: cupNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);
const Color cupNavBarBorderColor = Color(0x4C000000);
const Color cupBarrierColor = CupertinoDynamicColor.withBrightness(
  color: Color(0x33000000),
  darkColor: Color(0x7A000000),
);
const double cupMinInteractiveDimension = 44.0;
const double cupNavBarPersistentHeight = cupMinInteractiveDimension;
const double cupNavBarLargeTitleHeightExtension = 52.0;
const double cupNavBarShowLargeTitleThreshold = 10.0;
const double cupNavBarEdgePadding = 16.0;
const double cupNavBarBackButtonTapWidth = 50.0;
const Duration cupNavBarTitleFadeDuration = Duration(milliseconds: 150);
const CupHeroTag cupHeroTag = CupHeroTag(null);

@immutable
class CupHeroTag {
  const CupHeroTag(this.navigator);
  final NavigatorState? navigator;
  @override
  String toString() =>
      'Default Hero tag navigation bars with navigator $navigator';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CupHeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode => identityHashCode(navigator);
}

const int matRadialReactionAlpha = 0x1F;
const double matToolbarHeight = 56.0;
const double matRadialReactionRadius = 20.0;
const double matMaxTitleTextScaleFactor = 1.34;
const double matMinInteractiveDimension = 48.0;
const double matBottomNavigationBarHeight = 56.0;
const double matLeadingWidth = matToolbarHeight;
const double matTextTabBarHeight = matMinInteractiveDimension;
const Duration matTabScrollDuration = Duration(milliseconds: 300);
const Duration matThemeChangeDuration = Duration(milliseconds: 200);
const Duration matRadialReactionDuration = Duration(milliseconds: 200);
const EdgeInsets matListPadding = EdgeInsets.symmetric(vertical: 8.0);
const EdgeInsets matTabLabelPadding = EdgeInsets.symmetric(horizontal: 16.0);

class OSWidgetProvider extends StatefulWidget {
  const OSWidgetProvider({
    required this.builder,
    this.initialOS,
    this.settings,
  });

  final WidgetBuilder builder;
  final TargetPlatform? initialOS;
  final OSSettingsData? settings;

  static OSWidgetProviderState? of(BuildContext context) {
    _OSProviderState? state =
        context.findAncestorStateOfType<_OSProviderState>();
    return state?.state;
  }

  @override
  _OSProviderState createState() => _OSProviderState();
}

class _OSProviderState extends State<OSWidgetProvider> {
  late TargetPlatform? os;

  OSWidgetProviderState get state => OSWidgetProviderState._(this);

  @override
  void initState() {
    super.initState();
    os = widget.initialOS;
  }

  void changeToOS(TargetPlatform platform) {
    setState(() {
      os = platform;
    });
  }

  void changeToMaterial() {
    setState(() {
      os = TargetPlatform.android;
    });
  }

  void changeToCupertino() {
    setState(() {
      os = TargetPlatform.iOS;
    });
  }

  void changeToFluent() {
    setState(() {
      os = TargetPlatform.windows;
    });
  }

  void changeToAuto() {
    setState(() {
      os = null;
    });
  }

  OSSettingsData? get settings => widget.settings;

  @override
  Widget build(BuildContext context) {
    if (os == null) return widget.builder(context);
    return _material.Theme(
        data: _material.Theme.of(context).copyWith(platform: os),
        child: Builder(builder: (context) => widget.builder(context)));
  }
}

class OSWidgetProviderState {
  OSWidgetProviderState._(this._parent);
  final _OSProviderState _parent;
  TargetPlatform? get os => _parent.os;
  OSSettingsData get settings => _parent.settings ?? OSSettingsData();
  void changeToMaterial() {
    _parent.changeToMaterial();
  }

  void changeToCupertino() {
    _parent.changeToCupertino();
  }

  void changeToFluent() {
    _parent.changeToFluent();
  }

  void changeToAuto() {
    _parent.changeToAuto();
  }
}

class UIStyleData {
  final UIStyle web;
  final UIStyle android;
  final UIStyle ios;
  final UIStyle linux;
  final UIStyle mac;
  final UIStyle windows;
  final UIStyle fuchsia;

  const UIStyleData({
    this.web = UIStyle.material,
    this.android = UIStyle.material,
    this.ios = UIStyle.cupertino,
    this.linux = UIStyle.fluent,
    this.mac = UIStyle.cupertino,
    this.windows = UIStyle.fluent,
    this.fuchsia = UIStyle.material,
  });
}

class OSSettingsData {
  final bool iosUsesMaterial;
  final bool legacyIosUsesMaterial;
  final bool legacyMaterialDialogActionButtons;
  final UIStyleData uiStyle;
  OSSettingsData({
    this.iosUsesMaterial = false,
    this.legacyIosUsesMaterial = false,
    this.legacyMaterialDialogActionButtons = false,
    this.uiStyle = const UIStyleData(),
  });
}

bool isMaterial(BuildContext context) {
  return _uiStyle(context) == UIStyle.material;
}

bool isCupertino(BuildContext context) {
  return _uiStyle(context) == UIStyle.cupertino;
}

bool isFluent(BuildContext context) {
  return _uiStyle(context) == UIStyle.fluent;
}

T uiThemeData<T>(
  BuildContext context, {
  required T Function(_material.ThemeData theme) materialTheme,
  required T Function(CupertinoThemeData theme) cupertinoTheme,
  required T Function(_fluent.ThemeData theme) fluentTheme,
}) {
  if (isFluent(context)) {
    return fluentTheme(_fluent.FluentTheme.of(context));
  } else if (isCupertino(context)) {
    return cupertinoTheme(CupertinoTheme.of(context));
  } else {
    return materialTheme(_material.Theme.of(context));
  }
}

OS os(BuildContext context) {
  if (kIsWeb) {
    return OS.web;
  }
  switch (_material.Theme.of(context).platform) {
    case TargetPlatform.android:
      return OS.android;
    case TargetPlatform.iOS:
      return OS.ios;
    case TargetPlatform.linux:
      return OS.linux;
    case TargetPlatform.macOS:
      return OS.mac;
    case TargetPlatform.windows:
      return OS.windows;
    case TargetPlatform.fuchsia:
      return OS.fuchsia;
  }
}

Future<T?> showNaceyDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool? barrierDismissible,
  RouteSettings? routeSettings,
  bool useRootNavigator = true,
  bool materialUseSafeArea = true,
  Color? materialBarrierColor = _material.Colors.black54,
  String? barrierLabel,
}) {
  if (isMaterial(context)) {
    return _material.showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible ?? true,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      useSafeArea: materialUseSafeArea,
      barrierColor: materialBarrierColor,
      barrierLabel: barrierLabel,
    );
  } else if (isCupertino(context)) {
    return showCupertinoDialog<T>(
      context: context,
      builder: builder,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible ?? false,
      barrierLabel: barrierLabel,
    );
  } else {
    return _fluent.showDialog(
      context: context,
      builder: builder,
      routeSettings: routeSettings,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible ?? false,
      barrierLabel: barrierLabel,
      barrierColor: materialBarrierColor,
    );
  }
}

class MaterialModalSheetData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final Clip? clipBehavior;
  final Color? barrierColor;
  final bool enableDrag;
  final bool isDismissible;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;
  final BoxConstraints? constraints;

  MaterialModalSheetData({
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.clipBehavior,
    this.barrierColor,
    this.enableDrag = false,
    this.isDismissible = false,
    this.routeSettings,
    this.transitionAnimationController,
    this.constraints,
  });
}

class CupertinoModalSheetData {
  final ImageFilter? imageFilter;
  final bool? semanticsDismissible;
  final bool useRootNavigator;
  final Color barrierColor;
  final bool barrierDismissible;
  final RouteSettings? routeSettings;

  CupertinoModalSheetData({
    this.imageFilter,
    this.semanticsDismissible,
    this.useRootNavigator = true,
    this.barrierColor = cupBarrierColor,
    this.barrierDismissible = true,
    this.routeSettings,
  });
}

class FluentModalSheetData {
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final Color? barrierColor;
  final bool enableDrag;
  final bool isDismissible;
  final RouteSettings? routeSettings;
  final AnimationController? transitionAnimationController;

  FluentModalSheetData({
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.isScrollControlled = true,
    this.useRootNavigator = false,
    this.barrierColor,
    this.enableDrag = true,
    this.isDismissible = true,
    this.routeSettings,
    this.transitionAnimationController,
  });
}

Future<T?> naceyModalSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  MaterialModalSheetData? material,
  CupertinoModalSheetData? cupertino,
  FluentModalSheetData? fluent,
}) {
  if (isFluent(context)) {
    return _fluent.showBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: fluent?.backgroundColor,
      elevation: fluent?.elevation,
      shape: fluent?.shape,
      isScrollControlled: fluent?.isScrollControlled ?? true,
      useRootNavigator: fluent?.useRootNavigator ?? false,
      barrierColor: fluent?.barrierColor,
      enableDrag: fluent?.enableDrag ?? true,
      isDismissible: fluent?.isDismissible ?? true,
      routeSettings: fluent?.routeSettings,
      transitionAnimationController: fluent?.transitionAnimationController,
    );
  } else if (isCupertino(context)) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: builder,
      filter: cupertino?.imageFilter,
      semanticsDismissible: cupertino?.semanticsDismissible,
      useRootNavigator: cupertino?.useRootNavigator ?? true,
      barrierColor: cupertino?.barrierColor ?? cupBarrierColor,
      barrierDismissible: cupertino?.barrierDismissible ?? true,
      routeSettings: cupertino?.routeSettings,
    );
  } else {
    return _material.showModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: material?.backgroundColor,
      elevation: material?.elevation,
      shape: material?.shape,
      isScrollControlled: material?.isScrollControlled ?? false,
      useRootNavigator: material?.useRootNavigator ?? false,
      clipBehavior: material?.clipBehavior,
      barrierColor: material?.barrierColor,
      enableDrag: material?.enableDrag ?? true,
      isDismissible: material?.isDismissible ?? true,
      routeSettings: material?.routeSettings,
      transitionAnimationController: material?.transitionAnimationController,
      constraints: material?.constraints,
    );
  }
}
