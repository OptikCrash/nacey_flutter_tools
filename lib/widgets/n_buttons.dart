import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Measured against iOS 12 in Xcode.
const EdgeInsets _kButtonPadding = EdgeInsets.all(16.0);
const EdgeInsets _kBackgroundButtonPadding = EdgeInsets.symmetric(
  vertical: 14.0,
  horizontal: 64.0,
);

class NButton extends ButtonStyleButton {
  const NButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.padding,
    this.pressedOpacity,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.alignment = Alignment.center,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.elevation = 2.0,
    this.hoverElevation = 4.0,
    this.focusElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.visualDensity = VisualDensity.standard,
    this.constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.materialTapTargetSize = MaterialTapTargetSize.padded,
    this.enableFeedback = true,
  }) : super(
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

  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<bool>? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color disabledColor;
  final bool autofocus;
  final Clip clipBehavior;
  final double? minSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry alignment;
  final double elevation;
  final double hoverElevation;
  final double focusElevation;
  final double highlightElevation;
  final double disabledElevation;
  final VisualDensity visualDensity;
  final BoxConstraints constraints;
  final ShapeBorder shape;
  final Duration animationDuration;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool enableFeedback;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
    );

    return ButtonStyle();
    // return ButtonStyle(
    //   backgroundColor: colorScheme.primary,
    //   foregroundColor: colorScheme.onPrimary,
    //   overlayColor: colorScheme.onSurface,
    //   shadowColor: theme.shadowColor,
    //   elevation: 2,
    //   textStyle: theme.textTheme.button,
    //   padding: scaledPadding,
    //   minimumSize: const Size(64, 36),
    //   maximumSize: Size.infinite,
    //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
    //   enabledMouseCursor: SystemMouseCursors.click,
    //   disabledMouseCursor: SystemMouseCursors.forbidden,
    //   visualDensity: theme.visualDensity,
    //   tapTargetSize: theme.materialTapTargetSize,
    //   animationDuration: kThemeChangeDuration,
    //   enableFeedback: true,
    //   alignment: Alignment.center,
    //   splashFactory: InkRipple.splashFactory,
    // );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return null;
  }

  @override
  bool get enabled => onPressed != null || onLongPress != null;

  @override
  _NButtonState createState() => _NButtonState();

  static MaterialStateProperty<T>? allOrNull<T>(T? value) => value == null ? null : MaterialStateProperty.all<T>(value);

  static EdgeInsetsGeometry scaledPadding(
      EdgeInsetsGeometry geometry1x,
      EdgeInsetsGeometry geometry2x,
      EdgeInsetsGeometry geometry3x,
      double textScaleFactor,
      ) {
    assert(geometry1x != null);
    assert(geometry2x != null);
    assert(geometry3x != null);
    assert(textScaleFactor != null);

    if (textScaleFactor <= 1) {
      return geometry1x;
    } else if (textScaleFactor >= 3) {
      return geometry3x;
    } else if (textScaleFactor <= 2) {
      return EdgeInsetsGeometry.lerp(geometry1x, geometry2x, textScaleFactor - 1)!;
    }
    return EdgeInsetsGeometry.lerp(geometry2x, geometry3x, textScaleFactor - 2)!;
  }
}

class _NButtonState extends State<NButton> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoButton(
      key: widget.key,
        child: widget.child,
        padding: widget.padding,
        color: widget.fillColor,
        disabledColor: widget.disabledColor,
        minSize: widget.minSize,
        pressedOpacity: widget.pressedOpacity,
        borderRadius: widget.borderRadius,
        alignment: widget.alignment,
        onPressed: widget.onPressed,
    )
    : RawMaterialButton(
        key: widget.key,
        onPressed: widget.onPressed,
        onLongPress: widget.onLongPress,
        onHighlightChanged: widget.onHighlightChanged,
        mouseCursor: widget.mouseCursor,
        textStyle: widget.textStyle,
        fillColor: widget.fillColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        highlightColor: widget.highlightColor,
        splashColor: widget.splashColor,
        elevation: widget.elevation,
        focusElevation: widget.focusElevation,
        hoverElevation: widget.hoverElevation,
        highlightElevation: widget.highlightElevation,
        disabledElevation: widget.disabledElevation,
        padding: widget.padding ?? const EdgeInsets.all(100.0),
        constraints: widget.constraints,
        shape: widget.shape,
        animationDuration: widget.animationDuration,
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        materialTapTargetSize: widget.materialTapTargetSize,
        child: widget.child,
        enableFeedback: widget.enableFeedback,
    );
  }
}