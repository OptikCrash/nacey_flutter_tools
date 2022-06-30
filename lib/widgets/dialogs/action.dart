import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart'
    show
        Clip,
        Color,
        CupertinoDialogAction,
        EdgeInsetsGeometry,
        FocusNode,
        ValueChanged;
import 'package:flutter/material.dart' as mat
    show
        Brightness,
        ButtonTextTheme,
        MaterialTapTargetSize,
        ButtonStyle,
        TextButton,
        Theme,
        MaterialStateProperty,
        MaterialStateColor,
        MaterialState;
import 'package:flutter/material.dart';
import 'package:nacey_flutter_tools/nacey_flutter_tools.dart';
import 'package:nacey_flutter_tools/widgets/nacey_widget.dart';

abstract class _DialogActionData {
  _DialogActionData({
    this.key,
    this.child,
    this.onPressed,
  });

  final Key? key;
  final Widget? child;
  final void Function()? onPressed;
}

class MaterialDialogActionData extends _DialogActionData {
  MaterialDialogActionData({
    Key? key,
    Widget? child,
    VoidCallback? onPressed,
    this.onLongPress,
    this.focusNode,
    this.style,
    this.autoFocus,
    this.clipBehavior,
    this.icon,
    this.onHover,
    this.onFocusChange,
  }) : super(key: key, child: child, onPressed: onPressed);

  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final mat.ButtonStyle? style;
  final bool? autoFocus;
  final Clip? clipBehavior;
  final Widget? icon;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
}

class MaterialLegacyDialogActionData extends _DialogActionData {
  MaterialLegacyDialogActionData({
    Widget? child,
    void Function()? onPressed,
    Key? key,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledTextColor,
    this.highlightColor,
    this.onHighlightChanged,
    this.padding,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus,
    this.visualDensity,
    this.onLongPress,
    this.mouseCursor,
    this.height,
    this.minWidth,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
        );

  final Color? color;
  final mat.Brightness? colorBrightness;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? highlightColor;
  final ValueChanged<bool>? onHighlightChanged;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final Color? splashColor;
  final Color? textColor;
  final mat.ButtonTextTheme? textTheme;
  final Clip? clipBehavior;
  final mat.MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VisualDensity? visualDensity;
  final void Function()? onLongPress;
  final MouseCursor? mouseCursor;
  final double? height;
  final double? minWidth;
}

class CupertinoDialogActionData extends _DialogActionData {
  CupertinoDialogActionData({
    Key? key,
    Widget? child,
    VoidCallback? onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
        );

  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final TextStyle? textStyle;
}

class FluentDialogActionData extends _DialogActionData {
  FluentDialogActionData({
    Key? key,
    Widget? child,
    VoidCallback? onPressed,
    this.isDefaultAction,
    this.onLongPressed,
    this.focusNode,
    this.autoFocus = false,
    this.style,
  });
  final bool? isDefaultAction;
  final VoidCallback? onLongPressed;
  final FocusNode? focusNode;
  final bool autoFocus;
  late final mat.ButtonStyle? style;
}

class NaceyDialogAction
    extends NaceyWidgetBase<Widget, CupertinoDialogAction, Button> {
  final Widget? child;
  final void Function()? onPressed;

  final NaceyBuilder<MaterialDialogActionData>? material;
  final NaceyBuilder<MaterialLegacyDialogActionData>? materialLegacy;
  final NaceyBuilder<CupertinoDialogActionData>? cupertino;
  final NaceyBuilder<FluentDialogActionData>? fluent;

  const NaceyDialogAction({
    Key? key,
    this.child,
    this.onPressed,
    this.material,
    this.materialLegacy,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  Widget createMaterialWidget(BuildContext context) {
    final settings = OSWidgetProvider.of(context)?.settings;
    if (settings?.legacyMaterialDialogActionButtons ?? false) {
      final data = materialLegacy?.call(context, os(context));
      assert(data?.child != null || child != null);
      if (data?.child is Text) {
        (data!.child as Text).style?.merge(TextStyle(
          color: mat.MaterialStateColor.resolveWith((state) {
            if (state.contains(mat.MaterialState.disabled)) {
              return data.disabledTextColor ??
                  Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
                  const Color(0x00000000);
            } else {
              return data.textColor ??
                  Theme.of(context).buttonTheme.colorScheme?.onSecondary ??
                  const Color(0x00000000);
            }
          }),
        ));
      }
      return mat.TextButton(
        key: data?.key ?? key,
        child: data?.child ?? child!,
        onPressed: data?.onPressed ?? onPressed,
        focusNode: data?.focusNode,
        autofocus: data?.autofocus ?? false,
        onLongPress: data?.onLongPress,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        style: mat.ButtonStyle(
          mouseCursor: mat.MaterialStateProperty.resolveWith((state) {
            return data?.mouseCursor;
          }),
          padding: mat.MaterialStateProperty.resolveWith((state) {
            return data?.padding;
          }),
          visualDensity: data?.visualDensity,
          shape: mat.MaterialStateProperty.resolveWith((state) {
            return data?.shape;
          }),
          backgroundColor: mat.MaterialStateProperty.resolveWith((state) {
            return data?.color;
          }),
          foregroundColor: mat.MaterialStateProperty.resolveWith((state) {
            return data?.textColor;
          }),
          overlayColor: mat.MaterialStateProperty.resolveWith((state) {
            if (state.contains(mat.MaterialState.hovered)) {
              return data?.hoverColor;
            } else if (state.contains(mat.MaterialState.focused)) {
              return data?.focusColor;
            }
            return null;
          }),
          shadowColor: mat.MaterialStateProperty.resolveWith((state) {
            return;
          }),
          surfaceTintColor: mat.MaterialStateProperty.resolveWith((state) {
            if (state.contains(mat.MaterialState.disabled)) {
              return data?.disabledColor;
            } else if (state.contains(mat.MaterialState.hovered)) {
              return data?.hoverColor;
            } else if (state.contains(mat.MaterialState.focused)) {
              return data?.focusColor;
            } else if (state.contains(mat.MaterialState.selected)) {
              return data?.splashColor;
            } else {
              return data?.color;
            }
          }),
          minimumSize: mat.MaterialStateProperty.resolveWith((state) {
            return Size.fromWidth(data?.minWidth ?? 100.0);
          }),
          maximumSize: mat.MaterialStateProperty.resolveWith((state) {
            return Size.fromHeight(data?.height ?? double.infinity);
          }),
          tapTargetSize: data?.materialTapTargetSize,
        ),
      );
    } else {
      final data = material?.call(context, os(context));
      assert(data?.child != null || child != null);
      final icon = data?.icon;
      if (icon != null) {
        return mat.TextButton.icon(
          key: data?.key ?? key,
          label: data?.child ?? child!,
          icon: icon,
          onPressed: data?.onPressed ?? onPressed,
          onLongPress: data?.onLongPress,
          autofocus: data?.autoFocus ?? false,
          clipBehavior: data?.clipBehavior ?? Clip.none,
          focusNode: data?.focusNode,
          style: data?.style,
          onHover: data?.onHover,
          onFocusChange: data?.onFocusChange,
        );
      } else {
        return mat.TextButton(
          key: data?.key ?? key,
          child: data?.child ?? child!,
          onPressed: data?.onPressed ?? onPressed,
          onLongPress: data?.onLongPress,
          autofocus: data?.autoFocus ?? false,
          clipBehavior: data?.clipBehavior ?? Clip.none,
          focusNode: data?.focusNode,
          style: data?.style,
        );
      }
    }
  }

  @override
  CupertinoDialogAction createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, os(context));
    assert(data?.child != null || child != null);
    return CupertinoDialogAction(
      key: data?.key ?? key,
      child: data?.child ?? child!,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      onPressed: data?.onPressed ?? onPressed,
      textStyle: data?.textStyle,
    );
  }

  @override
  Button createFluentWidget(BuildContext context) {
    final data = fluent?.call(context, os(context));
    assert(data?.child != null && child != null);
    var mergeStyle;
    if (data != null && data.style == null) {
      mergeStyle = data.style?.merge(mat.ButtonStyle(
        backgroundColor: mat.MaterialStateColor.resolveWith((state) {
          if (state.contains(mat.MaterialState.hovered)) {
            return mat.Theme.of(context).hoverColor;
          } else if (state.contains(mat.MaterialState.focused)) {
            return mat.Theme.of(context).focusColor;
          } else if (state.contains(mat.MaterialState.disabled)) {
            return mat.Theme.of(context).disabledColor;
          } else if (state.contains(mat.MaterialState.error)) {
            return mat.Theme.of(context).colorScheme.error;
          } else {
            return data.isDefaultAction == true
                ? mat.Theme.of(context).colorScheme.primary
                : mat.Theme.of(context).colorScheme.secondary;
          }
        }),
        foregroundColor: mat.MaterialStateColor.resolveWith((state) {
          if (state.contains(mat.MaterialState.error)) {
            return mat.Theme.of(context).colorScheme.onError;
          } else {
            return data.isDefaultAction == true
                ? mat.Theme.of(context).colorScheme.onPrimary
                : mat.Theme.of(context).colorScheme.onSecondary;
          }
        }),
      ));
    } else {
      mergeStyle = data?.style;
    }
    return Button(
      key: data?.key,
      child: data?.child ?? child!,
      onPressed: data?.onPressed,
      onLongPress: data?.onLongPressed,
      focusNode: data?.focusNode,
      autofocus: data?.autoFocus ?? false,
      style: mergeStyle,
    );
  }
}
