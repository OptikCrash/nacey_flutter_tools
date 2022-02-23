import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../nacey_flutter_tools.dart';

class NButton extends ButtonStyleButton {
  //region constructors
  const NButton(
      {Key? key,
      required onPressed,
      required child,
      onLongPress,
      onHover,
      onFocusChange,
      style,
      focusNode,
      this.padding,
      this.pressedOpacity,
      this.onHighlightChanged,
      this.mouseCursor,
      this.enabledMouseCursor,
      this.hoveredMouseCursor,
      this.disabledMouseCursor,
      this.textStyle,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.disabledColor = CupertinoColors.quaternarySystemFill,
      autofocus = false,
      clipBehavior = Clip.none,
      this.alignment = Alignment.center,
      this.minSize,
      this.borderRadius,
      this.elevation,
      this.hoverElevation,
      this.focusElevation,
      this.highlightElevation,
      this.disabledElevation,
      this.visualDensity = VisualDensity.standard,
      this.constraints,
      this.shape,
      this.animationDuration = kThemeChangeDuration,
      this.materialTapTargetSize = MaterialTapTargetSize.padded,
      this.enableFeedback = true,
      this.useMaterial = false,
      this.useCupertino = false,
      this.useCupertinoPro = false,
      this.useFluent = false,
      this.useLinux = false,
      this.useWeb = false,
      this.isGrey = false,
      this.isFlat = false,
      this.isFilled = false,
      this.isTinted = false,
      this.isIconOnly = false,
      this.corner = CornerType.circular})
      : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: child,
        );

  factory NButton.icon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) =>
      NButtonWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
        corner: corner,
        iconPlacement: iconPlacement,
      );

  factory NButton.flat({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
  }) =>
      NButtonFlat(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        corner: corner,
      );

  factory NButton.flatWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) =>
      NButtonFlatWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
        corner: corner,
        iconPlacement: iconPlacement,
      );

  factory NButton.tinted({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
  }) =>
      NButtonTinted(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        corner: corner,
      );

  factory NButton.tintedWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) =>
      NButtonTintedWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
        corner: corner,
        iconPlacement: iconPlacement,
      );

  factory NButton.filled({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
  }) =>
      NButtonFilled(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        corner: corner,
      );

  factory NButton.filledWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) =>
      NButtonFilledWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
        corner: corner,
        iconPlacement: iconPlacement,
      );

  factory NButton.grey({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
  }) =>
      NButtonGrey(
        key: key,
        child: child,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        corner: corner,
      );

  factory NButton.greyWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) =>
      NButtonGreyWithIcon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        icon: icon,
        label: label,
        corner: corner,
        iconPlacement: iconPlacement,
      );

  //endregion
  //region properties
  final EdgeInsetsGeometry? padding;
  final ValueChanged<bool>? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final MouseCursor? enabledMouseCursor;
  final MouseCursor? hoveredMouseCursor;
  final MouseCursor? disabledMouseCursor;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color disabledColor;
  final double? minSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final double? elevation;
  final double? hoverElevation;
  final double? focusElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final VisualDensity visualDensity;
  final BoxConstraints? constraints;
  final OutlinedBorder? shape;
  final Duration animationDuration;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool enableFeedback;
  final bool useMaterial;
  final bool useCupertino;
  final bool useCupertinoPro;
  final bool useFluent;
  final bool useLinux;
  final bool useWeb;
  final bool isFlat;
  final bool isGrey;
  final bool isFilled;
  final bool isTinted;
  final bool isIconOnly;
  final CornerType corner;
  //endregion
  //region functions
  ButtonStyle styleFrom({
    Color? primary,
    Color? onSurface,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    final OS _operatingSystem = (useMaterial)
        ? OS.android
        : (useCupertino)
            ? OS.ios
            : (useCupertinoPro)
                ? OS.mac
                : (useFluent)
                    ? OS.windows
                    : (useLinux)
                        ? OS.linux
                        : (useWeb)
                            ? OS.web
                            : (Platform.isAndroid)
                                ? OS.android
                                : (Platform.isIOS)
                                    ? OS.ios
                                    : (Platform.isMacOS)
                                        ? OS.mac
                                        : (Platform.isWindows)
                                            ? OS.windows
                                            : (Platform.isLinux)
                                                ? OS.linux
                                                : OS.web;
    final ButtonKind _buttonKind = (isFlat)
        ? ButtonKind.flat
        : (isFilled)
            ? ButtonKind.filled
            : (isTinted)
                ? ButtonKind.tinted
                : (isGrey)
                    ? ButtonKind.grey
                    : ButtonKind.outlined;
    final MaterialStateProperty<Color?> _background = _NButtonDefaultBackground(
        primary, backgroundColor, onSurface, _buttonKind, _operatingSystem);
    final MaterialStateProperty<Color?> _foreground = _NButtonDefaultForeground(
        primary, textStyle?.color, onSurface, _buttonKind, _operatingSystem);
    final MaterialStateProperty<Color?> _overlay = _NButtonDefaultOverlay(
        onSurface,
        backgroundColor,
        textStyle?.color ?? onSurface,
        _buttonKind,
        _operatingSystem);
    final MaterialStateProperty<double>? _elevationValue =
        _NButtonDefaultElevation(_buttonKind, _operatingSystem);
    final MaterialStateProperty<MouseCursor?>? _mouseCursor =
        _NButtonDefaultMouseCursor(mouseCursor, enabledMouseCursor,
            disabledMouseCursor, hoveredMouseCursor, _operatingSystem);

    return ButtonStyle(
      textStyle: NButton.allOrNull(textStyle),
      foregroundColor: _foreground,
      backgroundColor: _background,
      overlayColor: _overlay,
      shadowColor: NButton.allOrNull<Color>(shadowColor),
      elevation: _elevationValue,
      padding: NButton.allOrNull(padding),
      minimumSize: NButton.allOrNull<Size>(minimumSize),
      fixedSize: NButton.allOrNull<Size>(fixedSize),
      maximumSize: NButton.allOrNull<Size>(maximumSize),
      side: NButton.allOrNull<BorderSide>(side),
      shape: NButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: _mouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }

  @override
  ButtonStyle defaultStyleOf(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final EdgeInsetsGeometry scaledPaddingMaterial =
        ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );
    final EdgeInsetsGeometry scaledPaddingCupertino =
        ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 12),
      const EdgeInsets.symmetric(horizontal: 6),
      const EdgeInsets.symmetric(horizontal: 3),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );

    final OS _operatingSystem = (useMaterial)
        ? OS.android
        : (useCupertino)
            ? OS.ios
            : (useCupertinoPro)
                ? OS.mac
                : (useFluent)
                    ? OS.windows
                    : (useLinux)
                        ? OS.linux
                        : (useWeb)
                            ? OS.web
                            : (Platform.isAndroid)
                                ? OS.android
                                : (Platform.isIOS)
                                    ? OS.ios
                                    : (Platform.isMacOS)
                                        ? OS.mac
                                        : (Platform.isWindows)
                                            ? OS.windows
                                            : (Platform.isLinux)
                                                ? OS.linux
                                                : OS.web;
    final ButtonKind _buttonKind = (isFlat)
        ? ButtonKind.flat
        : (isFilled)
            ? ButtonKind.filled
            : (isTinted)
                ? ButtonKind.tinted
                : (isGrey)
                    ? ButtonKind.grey
                    : ButtonKind.outlined;

    final scaledPadding = (useMaterial || useFluent)
        ? scaledPaddingMaterial
        : (useCupertino || useCupertinoPro)
            ? scaledPaddingCupertino
            : (Platform.isIOS || Platform.isMacOS)
                ? scaledPaddingCupertino
                : scaledPaddingMaterial;

    final fontFamily = (useMaterial)
        ? 'Roboto'
        : (useFluent)
            ? 'Segoe'
            : (useCupertino)
                ? 'SanFrancisco-Compact'
                : (useCupertinoPro)
                    ? 'SanFrancisco-Pro'
                    : (useLinux)
                        ? 'Cantarell'
                        : (useWeb)
                            ? 'Arial'
                            : (Platform.isIOS)
                                ? 'SanFrancisco-Compact'
                                : (Platform.isMacOS)
                                    ? 'SanFrancisco-Pro'
                                    : (Platform.isAndroid)
                                        ? 'Roboto'
                                        : (Platform.isWindows)
                                            ? 'Segoe'
                                            : (Platform.isLinux)
                                                ? 'Cantarell'
                                                : 'Arial';
    Color background = (_buttonKind == ButtonKind.filled)
        ? colorScheme.primary
        : (_buttonKind == ButtonKind.tinted)
            ? colorScheme.primary.withOpacity(0.1)
            : (_buttonKind == ButtonKind.grey)
                ? colorScheme.onSurface.withOpacity(0.1)
                : Colors.transparent;
    Color foreground = (_buttonKind == ButtonKind.filled)
        ? colorScheme.onPrimary
        : colorScheme.primary;
    double borderWidth = (_buttonKind == ButtonKind.flat)
        ? 0
        : ((useFluent || _operatingSystem == OS.windows) &&
                _buttonKind != ButtonKind.flat)
            ? 1.5
            : ((useMaterial || _operatingSystem == OS.android) &&
                    _buttonKind != ButtonKind.flat)
                ? 1.25
                : 1.75;
    BorderStyle borderStyle = (_buttonKind == ButtonKind.outlined ||
            ((!useCupertino &&
                    !useCupertinoPro &&
                    _operatingSystem != OS.ios &&
                    _operatingSystem != OS.mac) &&
                _buttonKind != ButtonKind.flat))
        ? BorderStyle.solid
        : BorderStyle.none;
    Color borderColor = (useMaterial && _buttonKind == ButtonKind.outlined) ||
            (_operatingSystem == OS.android &&
                _buttonKind == ButtonKind.outlined)
        ? colorScheme.primary
        : (_buttonKind == ButtonKind.outlined ||
                (_buttonKind == ButtonKind.filled &&
                    (_operatingSystem != OS.android && !useMaterial)) ||
                (useMaterial && _buttonKind == ButtonKind.grey) ||
                (_operatingSystem == OS.android &&
                    _buttonKind == ButtonKind.grey))
            ? colorScheme.onSurface.withOpacity(0.25)
            : colorScheme.primary;

    BorderSide _side = BorderSide(
      color: borderColor,
      width: borderWidth,
      style: borderStyle,
    );

    final Size _minSize = Size(
        (useFluent || _operatingSystem == OS.windows)
            ? 120
            : (useMaterial || _operatingSystem == OS.android)
                ? 100
                : (useCupertino || _operatingSystem == OS.ios)
                    ? 90
                    : (useCupertinoPro || _operatingSystem == OS.mac)
                        ? 100
                        : (useLinux || _operatingSystem == OS.linux)
                            ? 100
                            : (useWeb)
                                ? 120
                                : 36,
        (useFluent || _operatingSystem == OS.windows)
            ? 32
            : (useMaterial || _operatingSystem == OS.android)
                ? 36
                : (useCupertino || _operatingSystem == OS.ios)
                    ? 44
                    : (useCupertinoPro || _operatingSystem == OS.mac)
                        ? 46
                        : (useLinux || _operatingSystem == OS.linux)
                            ? 30
                            : (useWeb)
                                ? 48
                                : 36);

    final double _fontSize = (useMaterial || _operatingSystem == OS.android)
        ? 14
        : (useCupertino || _operatingSystem == OS.ios)
            ? 16
            : (useCupertinoPro || _operatingSystem == OS.mac)
                ? 16
                : (useFluent || _operatingSystem == OS.windows)
                    ? 14
                    : (useLinux || _operatingSystem == OS.linux)
                        ? 16
                        : (useWeb)
                            ? 24
                            : 18;
    final FontWeight _fontWeight = (useMaterial)
        ? FontWeight.w600
        : (useCupertino)
            ? FontWeight.w600
            : (useCupertinoPro)
                ? FontWeight.w600
                : (useFluent)
                    ? FontWeight.w600
                    : (useLinux)
                        ? FontWeight.w600
                        : (useWeb)
                            ? FontWeight.w400
                            : FontWeight.w600;

    ButtonStyle buttonStyle = styleFrom(
      textStyle: theme.textTheme.button?.copyWith(
        color: foreground,
        fontFamily: fontFamily,
        fontWeight: _fontWeight,
        fontSize: _fontSize,
      ),
      backgroundColor: background,
      foregroundColor: foreground,
      overlayColor: colorScheme.primary.withOpacity(0.2),
      shadowColor: theme.shadowColor,
      padding: scaledPadding,
      minimumSize: _minSize,
      maximumSize: Size.infinite,
      side: _side,
      shape: _nButtonDefaultShape(_side, _operatingSystem),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.basic,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
      primary: colorScheme.primary,
      onSurface: colorScheme.onSurface,
    );
    return buttonStyle;
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      OutlinedButtonTheme.of(context).style;

  @override
  bool get enabled => onPressed != null || onLongPress != null;

  static MaterialStateProperty<T>? allOrNull<T>(T? value) =>
      value == null ? null : MaterialStateProperty.all<T>(value);

  static EdgeInsetsGeometry scaledPadding(
    EdgeInsetsGeometry geometry1x,
    EdgeInsetsGeometry geometry2x,
    EdgeInsetsGeometry geometry3x,
    double textScaleFactor,
  ) {
    if (textScaleFactor <= 1) {
      return geometry1x;
    } else if (textScaleFactor >= 3) {
      return geometry3x;
    } else if (textScaleFactor <= 2) {
      return EdgeInsetsGeometry.lerp(
          geometry1x, geometry2x, textScaleFactor - 1)!;
    }
    return EdgeInsetsGeometry.lerp(
        geometry2x, geometry3x, textScaleFactor - 2)!;
  }
//endregion
}

class NButtonWithIcon extends NButton {
  NButtonWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isFlat = false,
    bool isGrey = false,
    bool isFilled = false,
    bool isTinted = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(
              icon: icon, label: Text(label), iconPlacement: iconPlacement),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isFlat: isFlat,
          isGrey: isGrey,
          isFilled: isFilled,
          isTinted: isTinted,
          isIconOnly: isIconOnly,
          corner: corner,
        );
}

class NButtonFlat extends NButton {
  //region constructor
  const NButtonFlat({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isFlat: true,
          isGrey: false,
          isFilled: false,
          isTinted: false,
          isIconOnly: isIconOnly,
          corner: corner,
        );
//endregion
}

class NButtonFlatWithIcon extends NButtonFlat {
  NButtonFlatWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(
              icon: icon, label: Text(label), iconPlacement: iconPlacement),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isIconOnly: isIconOnly,
          corner: corner,
        );
}

class NButtonTinted extends NButton {
  //region constructor
  const NButtonTinted({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isFlat: false,
          isGrey: false,
          isFilled: false,
          isTinted: true,
          isIconOnly: isIconOnly,
          corner: corner,
        );
//endregion
}

class NButtonTintedWithIcon extends NButtonTinted {
  NButtonTintedWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(
              icon: icon, label: Text(label), iconPlacement: iconPlacement),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isIconOnly: isIconOnly,
          corner: corner,
        );
}

class NButtonFilled extends NButton {
  //region constructor
  const NButtonFilled({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isFlat: false,
          isGrey: false,
          isFilled: true,
          isTinted: false,
          isIconOnly: isIconOnly,
          corner: corner,
        );
//endregion
}

class NButtonFilledWithIcon extends NButtonFilled {
  NButtonFilledWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(
              icon: icon, label: Text(label), iconPlacement: iconPlacement),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isIconOnly: isIconOnly,
          corner: corner,
        );
}

class NButtonGrey extends NButton {
  //region constructor
  const NButtonGrey({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isFlat: false,
          isGrey: true,
          isFilled: false,
          isTinted: false,
          isIconOnly: isIconOnly,
          corner: corner,
        );
//endregion
}

class NButtonGreyWithIcon extends NButtonGrey {
  NButtonGreyWithIcon({
    Key? key,
    required Icon icon,
    required String label,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    EdgeInsetsGeometry? padding,
    ValueChanged<bool>? onHighlightChanged,
    MouseCursor? mouseCursor,
    MouseCursor? enabledMouseCursor,
    MouseCursor? hoveredMouseCursor,
    MouseCursor? disabledMouseCursor,
    TextStyle? textStyle,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    double? minSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry alignment = Alignment.center,
    double? elevation,
    double? hoverElevation,
    double? focusElevation,
    double? highlightElevation,
    double? disabledElevation,
    VisualDensity visualDensity = VisualDensity.standard,
    BoxConstraints? constraints,
    OutlinedBorder? shape,
    Duration animationDuration = kThemeChangeDuration,
    MaterialTapTargetSize materialTapTargetSize = MaterialTapTargetSize.padded,
    bool enableFeedback = true,
    bool useMaterial = false,
    bool useCupertino = false,
    bool useCupertinoPro = false,
    bool useFluent = false,
    bool useLinux = false,
    bool useWeb = false,
    bool isIconOnly = false,
    CornerType corner = CornerType.circular,
    IconPlacement? iconPlacement,
  }) : super(
          key: key,
          child: _NButtonWithIconChild(
              icon: icon, label: Text(label), iconPlacement: iconPlacement),
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHover: onHover,
          onFocusChange: onFocusChange,
          style: style,
          focusNode: focusNode,
          padding: padding,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          enabledMouseCursor: enabledMouseCursor,
          hoveredMouseCursor: hoveredMouseCursor,
          disabledMouseCursor: disabledMouseCursor,
          textStyle: textStyle,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          disabledColor: disabledColor,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          minSize: minSize,
          pressedOpacity: pressedOpacity,
          borderRadius: borderRadius,
          alignment: alignment,
          elevation: elevation,
          hoverElevation: hoverElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          disabledElevation: disabledElevation,
          visualDensity: visualDensity,
          constraints: constraints,
          shape: shape,
          animationDuration: animationDuration,
          materialTapTargetSize: materialTapTargetSize,
          enableFeedback: enableFeedback,
          useMaterial: useMaterial,
          useCupertino: useCupertino,
          useCupertinoPro: useCupertinoPro,
          useFluent: useFluent,
          useLinux: useLinux,
          useWeb: useWeb,
          isIconOnly: isIconOnly,
          corner: corner,
        );
}

class _NButtonWithIconChild extends StatelessWidget {
  const _NButtonWithIconChild(
      {Key? key,
      required this.label,
      required this.icon,
      this.iconPlacement = IconPlacement.left})
      : super(key: key);

  final Widget label;
  final Widget icon;
  final IconPlacement? iconPlacement;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return (iconPlacement == IconPlacement.left)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              SizedBox(width: gap),
              Flexible(child: label),
            ],
          )
        : (iconPlacement == IconPlacement.right)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(child: label),
                  SizedBox(width: gap),
                  icon,
                ],
              )
            : (iconPlacement == IconPlacement.top)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      icon,
                      SizedBox(width: gap),
                      Flexible(child: label),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(child: label),
                      SizedBox(width: gap),
                      icon,
                    ],
                  );
  }
}

/*
              __________________________________________
    This Set  ||  flat   | tinted | NButton  |  filled    ||
              __________________________________________
    Cupertino || plain  | tinted | outlined | filled     ||grey
    Material  || text   | toggle | outlined | contained ||
              ==========================================
 */
enum IconPlacement { top, right, bottom, left }

enum ButtonKind { flat, grey, outlined, tinted, filled }

enum CornerType { square, beveled, rounded, circular }

// hovered
// focused
// pressed
// dragged
// selected
// scrolledUnder
// disabled
// error
@immutable
class _NButtonDefaultBackground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultBackground(this.fillColor, this.surfaceColor, this.textColor,
      this.buttonType, this.operatingSystem);

  final Color? fillColor;
  final Color? surfaceColor;
  final Color? textColor;
  final ButtonKind buttonType;
  final OS operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return textColor?.withOpacity(0.12);
    }
    Color? btnColor;
    switch (buttonType) {
      case ButtonKind.outlined:
        btnColor = null;
        break;
      case ButtonKind.grey:
        btnColor = surfaceColor?.withOpacity(0.1);
        break;
      case ButtonKind.flat:
        btnColor = null;
        break;
      case ButtonKind.tinted:
        btnColor = fillColor?.withOpacity(0.1);
        break;
      case ButtonKind.filled:
        btnColor = fillColor;
        break;
    }
    return btnColor;
  }
}

@immutable
class _NButtonDefaultForeground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultForeground(this.primary, this.onPrimary, this.onSurface,
      this.buttonType, this.operatingSystem);

  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;
  final ButtonKind buttonType;
  final OS operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return onSurface?.withOpacity(0.38);
    }
    return (buttonType == ButtonKind.filled) ? onPrimary : primary;
  }
}

@immutable
class _NButtonDefaultOverlay extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _NButtonDefaultOverlay(this.overlayColor, this.primary, this.onPrimary,
      this.buttonType, this.operatingSystem);

  final Color? overlayColor;
  final Color? primary;
  final Color? onPrimary;
  final ButtonKind buttonType;
  final OS operatingSystem;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return onPrimary?.withOpacity(0.08);
    }
    if (states.contains(MaterialState.focused) ||
        states.contains(MaterialState.pressed)) {
      return onPrimary?.withOpacity(0.24);
    }
    return overlayColor;
  }
}

@immutable
class _NButtonDefaultElevation extends MaterialStateProperty<double>
    with Diagnosticable {
  _NButtonDefaultElevation(this.buttonType, this.operatingSystem);

  final double elevation = 2.0;
  final ButtonKind buttonType;
  final OS operatingSystem;

  @override
  double resolve(Set<MaterialState> states) {
    if (buttonType == ButtonKind.flat ||
        buttonType == ButtonKind.tinted ||
        buttonType == ButtonKind.grey ||
        operatingSystem == OS.ios ||
        operatingSystem == OS.mac) {
      return 0.0;
    }
    if (states.contains(MaterialState.disabled)) {
      return 0.0;
    }
    if (states.contains(MaterialState.hovered)) {
      return elevation + 2.0;
    }
    if (states.contains(MaterialState.focused)) {
      return elevation + 2.0;
    }
    if (states.contains(MaterialState.pressed)) {
      return elevation + 6.0;
    }
    return elevation;
  }
}

@immutable
class _NButtonDefaultMouseCursor extends MaterialStateProperty<MouseCursor?>
    with Diagnosticable {
  _NButtonDefaultMouseCursor(this.mouseCursor, this.enabledCursor,
      this.disabledCursor, this.hoveredCursor, this.operatingSystem);

  final MouseCursor? mouseCursor;
  final MouseCursor? enabledCursor;
  final MouseCursor? disabledCursor;
  final MouseCursor? hoveredCursor;
  final OS operatingSystem;

  @override
  MouseCursor resolve(Set<MaterialState> states) => (mouseCursor == null)
      ? (states.contains(MaterialState.disabled))
          ? (disabledCursor ?? SystemMouseCursors.forbidden)
          : (states.contains(MaterialState.hovered))
              ? (hoveredCursor ?? SystemMouseCursors.basic)
              : (enabledCursor ?? SystemMouseCursors.click)
      : mouseCursor!;
}

OutlinedBorder _nButtonDefaultShape(BorderSide? borderSide, OS operatingSystem,
    {CornerType style = CornerType.rounded, double? cornerSize}) {
  if (cornerSize != null) {
    return (style == CornerType.beveled)
        ? BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerSize)),
            side: borderSide ?? const BorderSide())
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerSize)),
            side: borderSide ?? const BorderSide());
  }
  double _size = 0;
  switch (operatingSystem) {
    case OS.android:
      _size = (style == CornerType.beveled)
          ? 6
          : (style == CornerType.rounded)
              ? 4
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
    case OS.ios:
      _size = (style == CornerType.beveled)
          ? 8
          : (style == CornerType.rounded)
              ? 8
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
    case OS.mac:
      _size = (style == CornerType.beveled)
          ? 8
          : (style == CornerType.rounded)
              ? 16
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
    case OS.linux:
      _size = (style == CornerType.beveled)
          ? 8
          : (style == CornerType.rounded)
              ? 256
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
    case OS.windows:
      _size = (style == CornerType.beveled)
          ? 14
          : (style == CornerType.rounded)
              ? 4
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
    default:
      _size = (style == CornerType.beveled)
          ? 6
          : (style == CornerType.rounded)
              ? 24
              : (style == CornerType.circular)
                  ? 256
                  : 0;
      break;
  }

  return (style == CornerType.beveled)
      ? BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_size)),
          side: borderSide ?? const BorderSide())
      : RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_size)),
          side: borderSide ?? const BorderSide());
}
