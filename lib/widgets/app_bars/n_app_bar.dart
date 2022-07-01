import 'dart:math' as math;
import 'dart:ui';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nacey_flutter_tools/nacey_flutter_tools.dart';
import 'package:nacey_flutter_tools/widgets/app_bars/win_app_bar.dart';
import 'package:nacey_flutter_tools/widgets/nacey_widget.dart';

import 'cup_app_bar.dart';
import 'mat_app_bar.dart';

abstract class NaceyAppBarData {
  NaceyAppBarData({
    this.key,
    this.title,
    this.backgroundColor,
    this.leading,
    this.automaticallyImplyLeading,
  });

  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final Key? key;
  final bool? automaticallyImplyLeading;
}

class NaceyAppBar extends NaceyWidgetBase<PreferredSizeWidget, CupertinoAppBar,
    FluentAppBar> {
  final Widget? title;
  final Color? backgroundColor;
  final Widget? leading;
  final List<Widget>? trailingActions;
  final bool? automaticallyImplyLeading;

  final NaceyBuilder<MaterialAppBarData>? material;
  final NaceyBuilder<CupertinoAppBarData>? cupertino;
  final NaceyBuilder<FluentNavigationBarData>? fluent;

  const NaceyAppBar(
    Key? key, {
    this.title,
    this.backgroundColor,
    this.leading,
    this.trailingActions,
    this.automaticallyImplyLeading,
    this.material,
    this.cupertino,
    this.fluent,
  }) : super(key: key);

  @override
  PreferredSizeWidget createMaterialWidget(BuildContext context) {
    final data = material?.call(context, os(context));

    return MaterialAppBar(
      key: data?.key ?? key,
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      titleSpacing: data?.titleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
      actionsIconTheme: data?.actionsIconTheme,
      shape: data?.shape,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      shadowColor: data?.shadowColor,
      toolbarHeight: data?.toolbarHeight,
      leadingWidth: data?.leadingWidth,
      foregroundColor: data?.foregroundColor,
      systemOverlayStyle: data?.systemOverlayStyle,
      titleTextStyle: data?.titleTextStyle,
      toolbarTextStyle: data?.toolbarTextStyle,
    );
  }

  @override
  CupertinoAppBar createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, os(context));

    var trailing = trailingActions?.isEmpty ?? true
        ? null
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: trailingActions!,
          );

    final providerState = OSWidgetProvider.of(context);
    final noMaterialParent = data?.noMaterialParent ?? false;
    final useMaterial = (!noMaterialParent) &&
        (providerState?.settings.iosUsesMaterial ?? false);

    final heroTag = data?.heroTag;
    if (heroTag != null) {
      return CupertinoAppBar(
        key: data?.key ?? key,
        middle: data?.title ?? title,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        automaticallyImplyLeading: data?.automaticallyImplyLeading ??
            automaticallyImplyLeading ??
            true,
        automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
        previousPageTitle: data?.previousPageTitle,
        padding: data?.padding,
        border: data?.border ?? cupNavBarBorder,
        leading: (data?.leading ?? leading)?.withMaterial(useMaterial),
        trailing: (data?.trailing ?? trailing)?.withMaterial(useMaterial),
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        brightness: data?.brightness,
        heroTag: heroTag,
      );
    }

    return CupertinoAppBar(
      key: data?.key ?? key,
      middle: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      padding: data?.padding,
      border: data?.border ?? cupNavBarBorder,
      leading: (data?.leading ?? leading)?.withMaterial(useMaterial),
      trailing: (data?.trailing ?? trailing)?.withMaterial(useMaterial),
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
      brightness: data?.brightness,
      //heroTag: , used above
    );
  }

  @override
  FluentAppBar createFluentWidget(BuildContext context) {
    final data = fluent?.call(context, os(context));
    return FluentAppBar(
      key: data?.key ?? key,
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? trailingActions,
      automaticallyImplyLeading:
          data?.automaticallyImplyLeading ?? automaticallyImplyLeading ?? true,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      titleSpacing: data?.titleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
      actionsIconTheme: data?.actionsIconTheme,
      shape: data?.shape,
      excludeHeaderSemantics: data?.excludeHeaderSemantics ?? false,
      shadowColor: data?.shadowColor,
      toolbarHeight: data?.toolbarHeight,
      leadingWidth: data?.leadingWidth,
      foregroundColor: data?.foregroundColor,
      systemOverlayStyle: data?.systemOverlayStyle,
      titleTextStyle: data?.titleTextStyle,
      toolbarTextStyle: data?.toolbarTextStyle,
    );
  }
}
