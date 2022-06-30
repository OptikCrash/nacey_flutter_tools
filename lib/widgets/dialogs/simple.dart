import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../nacey_flutter_tools.dart';
import '../nacey_widget.dart';

const EdgeInsets _materialInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

const EdgeInsetsGeometry _materialTitlePadding =
    EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0);

const EdgeInsetsGeometry _materialContentPadding =
    EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0);

const EdgeInsetsGeometry _materialDialogPadding =
    EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);

const BoxConstraints _fluentConstraints = BoxConstraints(maxWidth: 368);

abstract class _SimpleData {
  _SimpleData({this.key, this.content, this.title});
  final Key? key;
  final Widget? content;
  final Widget? title;
}

class MaterialSimpleDialogData extends _SimpleData {
  MaterialSimpleDialogData({
    Key? key,
    Widget? content,
    Widget? title,
    this.titlePadding = _materialTitlePadding,
    this.titleTextStyle,
    this.children,
    this.contentPadding = _materialContentPadding,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = _materialInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
  }) : super(key: key, content: content, title: title);

  final EdgeInsetsGeometry titlePadding;
  final TextStyle? titleTextStyle;
  final List<Widget>? children;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;
  final double? elevation;
  final String? semanticLabel;
  final EdgeInsets? insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
}

class CupertinoSimpleDialogData extends _SimpleData {
  CupertinoSimpleDialogData({
    Key? key,
    Widget? content,
    Widget? title,
    this.children,
    this.childrenScrollController,
    this.scrollController,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
  }) : super(key: key);

  final List<Widget>? children;
  final ScrollController? childrenScrollController;
  final ScrollController? scrollController;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
}

class FluentAlertDialogData extends _SimpleData {
  FluentAlertDialogData({
    Key? key,
    Widget? content,
    Widget? title,
    this.actions,
    this.style,
    this.backgroundDismiss = true,
    this.constraints = _fluentConstraints,
  });

  final List<Widget>? actions;
  final ContentDialogThemeData? style;
  final bool backgroundDismiss;
  final BoxConstraints constraints;
}

class NaceySimpleDialogOptions extends StatelessWidget {
  const NaceySimpleDialogOptions({
    Key? key,
    this.onPressed,
    this.padding,
    this.child,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Widget? child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: padding ?? _materialDialogPadding,
        child: child,
      ),
    );
  }
}

class NaceySimpleDialog
    extends NaceyWidgetBase<SimpleDialog, CupertinoAlertDialog, ContentDialog> {
  final Widget? content;
  final Widget? title;

  final NaceyBuilder<MaterialSimpleDialogData>? material;
  final NaceyBuilder<CupertinoSimpleDialogData>? cupertino;
  final NaceyBuilder<FluentAlertDialogData>? fluent;

  const NaceySimpleDialog({
    Key? key,
    this.content,
    this.title,
    this.material,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  SimpleDialog createMaterialWidget(BuildContext context) {
    final data = material?.call(context, os(context));
    return SimpleDialog(
        key: data?.key ?? key,
        title: data?.title ?? title,
        titlePadding: data?.titlePadding ?? _materialTitlePadding,
        titleTextStyle: data?.titleTextStyle,
        children: data?.children,
        contentPadding: data?.contentPadding ?? _materialContentPadding,
        backgroundColor: data?.backgroundColor,
        elevation: data?.elevation,
        semanticLabel: data?.semanticLabel,
        insetPadding: data?.insetPadding ?? _materialInsetPadding,
        clipBehavior: data?.clipBehavior ?? Clip.none,
        shape: data?.shape,
        alignment: data?.alignment);
  }

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, os(context));

    return CupertinoAlertDialog(
      key: data?.key ?? key,
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.children ?? <Widget>[],
      scrollController: data?.scrollController,
      actionScrollController: data?.childrenScrollController,
      insetAnimationDuration:
          data?.insetAnimationDuration ?? const Duration(milliseconds: 100),
      insetAnimationCurve: data?.insetAnimationCurve ?? Curves.decelerate,
    );
  }

  @override
  ContentDialog createFluentWidget(BuildContext context) {
    final data = fluent?.call(context, os(context));

    return ContentDialog(
      key: data?.key ?? key,
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.actions ?? <Widget>[],
      style: data?.style,
      backgroundDismiss: data?.backgroundDismiss ?? true,
      constraints: data?.constraints ?? _fluentConstraints,
    );
  }
}
