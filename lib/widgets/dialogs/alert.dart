import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../nacey_flutter_tools.dart';
import '../nacey_widget.dart';

const EdgeInsets _defaultPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

abstract class _AlertData {
  _AlertData({this.key, this.actions, this.content, this.title});
  final Key? key;
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;
}

class MaterialAlertDialogData extends _AlertData {
  MaterialAlertDialogData({
    Key? key,
    List<Widget>? actions,
    Widget? content,
    Widget? title,
    this.contentTextStyle,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.contentPadding,
    this.semanticLabel,
    this.titlePadding,
    this.titleTextStyle,
    this.scrollable,
    this.actionsOverflowDirection,
    this.actionsPadding,
    this.buttonPadding,
    this.actionsOverflowButtonSpacing,
    this.clipBehavior,
    this.insetPadding,
    this.actionsAlignment,
    this.alignment,
  }) : super(key: key, actions: actions, content: content, title: title);

  final EdgeInsetsGeometry? contentPadding;
  final String? semanticLabel;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? contentTextStyle;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final TextStyle? titleTextStyle;
  final bool? scrollable;
  final VerticalDirection? actionsOverflowDirection;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final double? actionsOverflowButtonSpacing;
  final Clip? clipBehavior;
  final EdgeInsets? insetPadding;
  final MainAxisAlignment? actionsAlignment;
  final AlignmentGeometry? alignment;
}

class CupertinoAlertDialogData extends _AlertData {
  CupertinoAlertDialogData({
    Key? key,
    List<Widget>? actions,
    Widget? content,
    Widget? title,
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationCurve,
    this.insetAnimationDuration,
  }) : super(key: key, actions: actions, content: content, title: title);

  final ScrollController? scrollController;
  final ScrollController? actionScrollController;
  final Curve? insetAnimationCurve;
  final Duration? insetAnimationDuration;
}

class FluentAlertDialogData extends _AlertData {
  FluentAlertDialogData({
    Key? key,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    this.style,
    this.backgroundDismiss,
    this.constraints,
  }) : super(
          key: key,
          title: title,
          content: content,
          actions: actions,
        );

  final ContentDialogThemeData? style;
  final bool? backgroundDismiss;
  final BoxConstraints? constraints;
}

class NaceyAlertDialog
    extends NaceyWidgetBase<AlertDialog, CupertinoAlertDialog, ContentDialog> {
  final List<Widget>? actions;
  final Widget? content;
  final Widget? title;

  final NaceyBuilder<MaterialAlertDialogData>? material;
  final NaceyBuilder<CupertinoAlertDialogData>? cupertino;
  final NaceyBuilder<FluentAlertDialogData>? fluent;

  const NaceyAlertDialog({
    Key? key,
    this.actions,
    this.content,
    this.title,
    this.material,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  AlertDialog createMaterialWidget(BuildContext context) {
    final data = material?.call(context, os(context));

    return AlertDialog(
      key: data?.key ?? key,
      actions: data?.actions ?? actions,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      semanticLabel: data?.semanticLabel,
      title: data?.title ?? title,
      titlePadding: data?.titlePadding,
      contentTextStyle: data?.contentTextStyle,
      backgroundColor: data?.backgroundColor,
      elevation: data?.elevation,
      shape: data?.shape,
      titleTextStyle: data?.titleTextStyle,
      scrollable: data?.scrollable ?? false,
      actionsOverflowDirection: data?.actionsOverflowDirection,
      actionsPadding: data?.actionsPadding ?? EdgeInsets.zero,
      buttonPadding: data?.buttonPadding,
      actionsOverflowButtonSpacing: data?.actionsOverflowButtonSpacing,
      clipBehavior: data?.clipBehavior ?? Clip.none,
      insetPadding: data?.insetPadding ?? _defaultPadding,
      actionsAlignment: data?.actionsAlignment,
      alignment: data?.alignment,
    );
  }

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, os(context));

    Curve? curve = data?.insetAnimationCurve;

    return CupertinoAlertDialog(
      key: data?.key ?? key,
      actions: data?.actions ?? actions ?? const <Widget>[],
      content: data?.content ?? content,
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
      title: data?.title ?? title,
      insetAnimationCurve: curve ?? Curves.decelerate,
      insetAnimationDuration:
          data?.insetAnimationDuration ?? const Duration(milliseconds: 100),
    );
  }

  @override
  ContentDialog createFluentWidget(BuildContext context) {
    final data = fluent?.call(context, os(context));

    return ContentDialog(
      key: data?.key ?? key,
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.actions ?? actions,
      style: data?.style,
      backgroundDismiss: data?.backgroundDismiss ?? true,
      constraints: const BoxConstraints(maxWidth: 368),
    );
  }
}
