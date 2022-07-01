import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../nacey_flutter_tools.dart';
import 'n_app_bar.dart';

class FluentNavigationBarData extends NaceyAppBarData {
  FluentNavigationBarData({
    Widget? title,
    Color? backgroundColor,
    Widget? leading,
    Key? key,
    bool? automaticallyImplyLeading,
    this.actions,
    this.bottom,
    this.bottomOpacity,
    this.centerTitle,
    this.elevation,
    this.flexibleSpace,
    this.iconTheme,
    this.primary,
    this.titleSpacing,
    this.toolbarOpacity,
    this.actionsIconTheme,
    this.shape,
    this.excludeHeaderSemantics,
    this.shadowColor,
    this.toolbarHeight = winToolbarHeight,
    this.leadingWidth,
    this.foregroundColor,
    this.systemOverlayStyle,
    this.titleTextStyle,
    this.toolbarTextStyle,
  }) : super(
          key: key,
          title: title,
          backgroundColor: backgroundColor,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
        );

  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  final double? bottomOpacity;
  final bool? centerTitle;
  final double? elevation;
  final Widget? flexibleSpace;
  final IconThemeData? iconTheme;
  final bool? primary;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final IconThemeData? actionsIconTheme;
  final ShapeBorder? shape;
  final bool? excludeHeaderSemantics;
  final Color? shadowColor;
  final double? toolbarHeight;
  final double? leadingWidth;
  final Color? foregroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? toolbarTextStyle;
}

class FluentAppBar extends StatefulWidget implements PreferredSizeWidget {
  FluentAppBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize =
            _FluentAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  @override
  final _FluentAppBarSize preferredSize;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _FluentAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return ((AppBarTheme.of(context).toolbarHeight ?? winToolbarHeight) +
          (preferredSize.bottomHeight ?? 0));
    }
    return preferredSize.height;
  }

  bool _getEffectiveCenterTitle(ThemeData theme) {
    bool platformCenter() {
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return false;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return actions == null || actions!.length < 2;
      }
    }

    return centerTitle ?? theme.appBarTheme.centerTitle ?? platformCenter();
  }

  @override
  State<FluentAppBar> createState() => _FluentAppBarState();
}

class _FluentAppBarState extends State<FluentAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
    }
    _scrollNotificationObserver = ScrollNotificationObserver.of(context);
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.addListener(_handleScrollNotification);
    }
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        widget.notificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          _scrolledUnder = metrics.extentAfter > 0;
          break;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
          break;
        case AxisDirection.right:
        case AxisDirection.left:
          _scrolledUnder = false;
          break;
      }
      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {});
      }
    }
  }

  Color _resolveColor(Set<MaterialState> states, Color? widgetColor,
      Color? themeColor, Color defaultColor) {
    return MaterialStateProperty.resolveAs<Color?>(widgetColor, states) ??
        MaterialStateProperty.resolveAs<Color?>(themeColor, states) ??
        MaterialStateProperty.resolveAs<Color>(defaultColor, states);
  }

  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness,
      [Color? backgroundColor]) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return style.copyWith(statusBarColor: backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final AppBarTheme defaults = AppBarTheme.of(context);
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final Set<MaterialState> states = <MaterialState>{
      if (settings?.isScrolledUnder ?? _scrolledUnder)
        MaterialState.scrolledUnder,
    };

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final double toolbarHeight =
        widget.toolbarHeight ?? appBarTheme.toolbarHeight ?? matToolbarHeight;
    final bool backwardsCompatibility =
        appBarTheme.backwardsCompatibility ?? false;

    final Color backgroundColor = backwardsCompatibility
        ? widget.backgroundColor ??
            appBarTheme.backgroundColor ??
            theme.primaryColor
        : _resolveColor(
            states,
            widget.backgroundColor,
            appBarTheme.backgroundColor,
            defaults.backgroundColor!,
          );

    final Color foregroundColor = widget.foregroundColor ??
        appBarTheme.foregroundColor ??
        defaults.foregroundColor!;

    final double elevation =
        widget.elevation ?? appBarTheme.elevation ?? defaults.elevation!;

    final double effectiveElevation =
        states.contains(MaterialState.scrolledUnder)
            ? widget.scrolledUnderElevation ??
                appBarTheme.scrolledUnderElevation ??
                defaults.scrolledUnderElevation ??
                elevation
            : elevation;

    IconThemeData overallIconTheme = backwardsCompatibility
        ? widget.iconTheme ?? appBarTheme.iconTheme ?? theme.primaryIconTheme
        : widget.iconTheme ??
            appBarTheme.iconTheme ??
            defaults.iconTheme!.copyWith(color: foregroundColor);

    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        widget.iconTheme ??
        appBarTheme.iconTheme ??
        defaults.actionsIconTheme?.copyWith(color: foregroundColor) ??
        overallIconTheme;

    TextStyle? toolbarTextStyle = backwardsCompatibility
        ? Theme.of(context).textTheme.bodyText2 ??
            appBarTheme.textTheme?.bodyText2 ??
            theme.primaryTextTheme.bodyText2
        : widget.toolbarTextStyle ??
            appBarTheme.toolbarTextStyle ??
            defaults.toolbarTextStyle?.copyWith(color: foregroundColor);

    TextStyle? titleTextStyle = backwardsCompatibility
        ? Theme.of(context).textTheme?.headline6 ??
            appBarTheme.textTheme?.headline6 ??
            theme.primaryTextTheme.headline6
        : widget.titleTextStyle ??
            appBarTheme.titleTextStyle ??
            defaults.titleTextStyle?.copyWith(color: foregroundColor);

    if (widget.toolbarOpacity != 1.0) {
      final double opacity =
          const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
              .transform(widget.toolbarOpacity);
      if (titleTextStyle?.color != null) {
        titleTextStyle = titleTextStyle!
            .copyWith(color: titleTextStyle.color!.withOpacity(opacity));
      }
      if (toolbarTextStyle?.color != null) {
        toolbarTextStyle = toolbarTextStyle!
            .copyWith(color: toolbarTextStyle.color!.withOpacity(opacity));
      }
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0),
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0),
      );
    }

    Widget? leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          iconSize: overallIconTheme.size ?? 24,
          onPressed: _handleDrawerButton,
          icon: const Icon(Icons.menu),
        );
      } else if ((!hasEndDrawer && canPop) ||
          (parentRoute?.impliesAppBarDismissal ?? false)) {
        leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: widget.leadingWidth ?? matToolbarHeight),
        child: leading,
      );
    }

    Widget? title = widget.title;
    if (title != null) {
      bool? namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          break;
      }

      title = _Title(child: title);
      if (!widget.excludeHeaderSemantics) {
        title = Semantics(
          namesRoute: namesRoute,
          header: true,
          child: title,
        );
      }

      title = DefaultTextStyle(
        style: titleTextStyle!,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: title ?? Container(),
      );

      // Set maximum text scale factor to [_kMaxTitleTextScaleFactor] for the
      // title to keep the visual hierarchy the same even with larger font
      // sizes. To opt out, wrap the [title] widget in a [MediaQuery] widget
      // with [MediaQueryData.textScaleFactor] set to
      // `MediaQuery.textScaleFactorOf(context)`.
      final MediaQueryData mediaQueryData = MediaQuery.of(context);
      title = MediaQuery(
        data: mediaQueryData.copyWith(
          textScaleFactor: min(
            mediaQueryData.textScaleFactor,
            1.34,
          ),
        ),
        child: title,
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        iconSize: overallIconTheme.size ?? 24,
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
      );
    }

    // Allow the trailing actions to have their own theme if necessary.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing ??
          appBarTheme.titleSpacing ??
          NavigationToolbar.kMiddleSpacing,
    );

    // If the toolbar is allocated less than toolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainer(toolbarHeight),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: toolbarTextStyle!,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: toolbarHeight),
              child: appBar,
            ),
          ),
          if (widget.bottomOpacity == 1.0)
            widget.bottom!
          else
            Opacity(
              opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
                  .transform(widget.bottomOpacity),
              child: widget.bottom,
            ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        bottom: false,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Semantics(
            sortKey: const OrdinalSortKey(1.0),
            explicitChildNodes: true,
            child: widget.flexibleSpace,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(0.0),
            explicitChildNodes: true,
            // Creates a material widget to prevent the flexibleSpace from
            // obscuring the ink splashes produced by appBar children.
            child: Material(
              type: MaterialType.transparency,
              child: appBar,
            ),
          ),
        ],
      );
    }

    final SystemUiOverlayStyle overlayStyle = backwardsCompatibility
        ? _systemOverlayStyleForBrightness(
            ThemeData.estimateBrightnessForColor(backgroundColor),
          )
        : widget.systemOverlayStyle ??
            appBarTheme.systemOverlayStyle ??
            defaults.systemOverlayStyle ??
            _systemOverlayStyleForBrightness(
              ThemeData.estimateBrightnessForColor(backgroundColor),
              // Make the status bar transparent for M3 so the elevation overlay
              // color is picked up by the statusbar.
              theme.useMaterial3 ? const Color(0x00000000) : null,
            );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: backgroundColor,
          elevation: effectiveElevation,
          shadowColor: widget.shadowColor ??
              appBarTheme.shadowColor ??
              defaults.shadowColor,
          surfaceTintColor: widget.surfaceTintColor ??
              appBarTheme.surfaceTintColor ??
              defaults.surfaceTintColor,
          shape: widget.shape ?? appBarTheme.shape ?? defaults.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

class _ToolbarContainer extends SingleChildLayoutDelegate {
  const _ToolbarContainer(this.toolbarHeight);
  final double toolbarHeight;
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainer oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}

class _RenderTitle extends RenderAligningShiftedBox {
  _RenderTitle({
    super.textDirection,
  }) : super(alignment: Alignment.center);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    final Size childSize = child!.getDryLayout(innerConstraints);
    return constraints.constrain(childSize);
  }

  @override
  void performLayout() {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    child!.layout(innerConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }
}

class _Title extends SingleChildRenderObjectWidget {
  const _Title({required Widget super.child}) : assert(child != null);

  @override
  _RenderTitle createRenderObject(BuildContext context) {
    return _RenderTitle(
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderTitle renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _FluentAppBarSize extends Size {
  _FluentAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? winToolbarHeight) + (bottomHeight ?? 0));
  final double? toolbarHeight;
  final double? bottomHeight;
}
