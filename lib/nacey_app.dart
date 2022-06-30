import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' show CupertinoApp, CupertinoThemeData;
import 'package:flutter/material.dart' as mat
    show MaterialApp, ScaffoldMessengerState, Theme, ThemeData, ThemeMode;

import 'nacey_flutter_tools.dart';
import 'widgets/nacey_widget.dart';

abstract class _AppBase {
  _AppBase({
    this.key,
    this.navKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
  });

  final Key? key;
  final GlobalKey<NavigatorState>? navKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool? useInheritedMediaQuery;
}

abstract class _RouteData {
  _RouteData({
    this.key,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
  });

  final Key? key;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool? useInheritedMediaQuery;
}

class MaterialAppData extends _AppBase {
  MaterialAppData({
    Key? key,
    GlobalKey<NavigatorState>? navKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
  }) : super(
          key: key,
          navKey: navKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          restorationScopeId: restorationScopeId,
          scrollBehavior: scrollBehavior,
          useInheritedMediaQuery: useInheritedMediaQuery,
        );

  final mat.ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final mat.ThemeData? darkTheme;
  final mat.ThemeMode? themeMode;
  final GlobalKey<mat.ScaffoldMessengerState>? scaffoldMessengerKey;
}

class MaterialAppRouterData extends _RouteData {
  MaterialAppRouterData({
    Key? key,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
  }) : super(
          key: key,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          scrollBehavior: scrollBehavior,
          useInheritedMediaQuery: useInheritedMediaQuery,
        );

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<mat.ScaffoldMessengerState>? scaffoldMessengerKey;
}

class CupertinoAppData extends _AppBase {
  CupertinoAppData({
    Key? key,
    GlobalKey<NavigatorState>? navKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
  }) : super(
          key: key,
          navKey: navKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          scrollBehavior: scrollBehavior,
          useInheritedMediaQuery: useInheritedMediaQuery,
        );

  final CupertinoThemeData? theme;
}

class CupertinoAppRouterData extends _RouteData {
  CupertinoAppRouterData({
    Key? key,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
  }) : super(
          key: key,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          routeInformationProvider: routeInformationProvider,
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          backButtonDispatcher: backButtonDispatcher,
          scrollBehavior: scrollBehavior,
          useInheritedMediaQuery: useInheritedMediaQuery,
        );

  final CupertinoThemeData? theme;
}

class FluentAppData extends _AppBase {
  FluentAppData({
    Key? key,
    GlobalKey<NavigatorState>? navKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
    this.darkTheme,
    this.themeMode,
  }) : super(
          key: key,
          navKey: navKey,
          home: home,
          routes: routes ?? const <String, WidgetBuilder>{},
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
          builder: builder,
          title: title ?? '',
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales ?? defaultSupportedLocales,
          showPerformanceOverlay: showPerformanceOverlay ?? false,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? false,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
          showSemanticsDebugger: showSemanticsDebugger ?? false,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? true,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          restorationScopeId: restorationScopeId,
          scrollBehavior: scrollBehavior ?? const FluentScrollBehavior(),
          useInheritedMediaQuery: useInheritedMediaQuery,
        );
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
}

class FluentAppRouterData extends _RouteData {
  FluentAppRouterData({
    Key? key,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    ScrollBehavior? scrollBehavior,
    bool? useInheritedMediaQuery,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
  }) : super(
          key: key,
          builder: builder,
          title: title ?? '',
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales ?? defaultSupportedLocales,
          showPerformanceOverlay: showPerformanceOverlay ?? false,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? false,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers ?? false,
          showSemanticsDebugger: showSemanticsDebugger ?? false,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner ?? true,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          scrollBehavior: scrollBehavior ?? const FluentScrollBehavior(),
          useInheritedMediaQuery: useInheritedMediaQuery ?? false,
        );

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
}

class NaceyApp
    extends NaceyWidgetBase<mat.MaterialApp, CupertinoApp, FluentApp> {
  final GlobalKey<NavigatorState>? navKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;

  final NaceyBuilder<MaterialAppData>? material;
  final NaceyBuilder<CupertinoAppData>? cupertino;
  final NaceyBuilder<FluentAppData>? fluent;
  final NaceyBuilder<MaterialAppRouterData>? materialRouter;
  final NaceyBuilder<CupertinoAppRouterData>? cupertinoRouter;
  final NaceyBuilder<FluentAppRouterData>? fluentRouter;

  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool? useInheritedMediaQuery;

  const NaceyApp({
    key,
    this.navKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
    this.material,
    this.cupertino,
    this.fluent,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        materialRouter = null,
        cupertinoRouter = null,
        fluentRouter = null,
        super(key: key);

  const NaceyApp.router({
    key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery,
    NaceyBuilder<MaterialAppRouterData>? material,
    NaceyBuilder<CupertinoAppRouterData>? cupertino,
    NaceyBuilder<FluentAppRouterData>? fluent,
  })  : navigatorObservers = null,
        navKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        material = null,
        cupertino = null,
        fluent = null,
        materialRouter = material,
        cupertinoRouter = cupertino,
        fluentRouter = fluent,
        super(key: key);

  @override
  createMaterialWidget(BuildContext context) {
    final dataRouter = materialRouter?.call(context, os(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null) {
      assert(dataRouter?.routerDelegate != null || routerDelegate != null);

      return mat.MaterialApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser!,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate!,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        theme: ((dataRouter?.theme ?? mat.Theme.of(context)) as mat.ThemeData?)
            ?.copyWith(platform: TargetPlatform.android),
        darkTheme: (dataRouter?.darkTheme as mat.ThemeData?)
            ?.copyWith(platform: TargetPlatform.android),
        highContrastDarkTheme:
            dataRouter?.highContrastDarkTheme as mat.ThemeData,
        highContrastTheme: dataRouter?.highContrastTheme as mat.ThemeData,
        themeMode: dataRouter?.themeMode ?? ThemeMode.system,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        debugShowMaterialGrid: dataRouter?.debugShowMaterialGrid ?? false,
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.key ?? key,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: dataRouter?.scaffoldMessengerKey,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery: dataRouter?.useInheritedMediaQuery ??
            useInheritedMediaQuery ??
            false,
      );
    } else {
      final data = material?.call(context, os(context));
      return mat.MaterialApp(
        key: data?.key ?? key,
        navigatorKey: data?.navKey ?? navKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: (data?.theme ?? mat.Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false,
        darkTheme: data?.darkTheme?.copyWith(platform: TargetPlatform.android),
        themeMode: data?.themeMode ?? ThemeMode.system,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        highContrastDarkTheme: data?.highContrastDarkTheme as mat.ThemeData,
        highContrastTheme: data?.highContrastTheme as mat.ThemeData,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: data?.scaffoldMessengerKey,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery:
            data?.useInheritedMediaQuery ?? useInheritedMediaQuery ?? false,
      );
    }
  }

  @override
  createCupertinoWidget(BuildContext context) {
    final dataRouter = cupertinoRouter?.call(context, os(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null) {
      assert(dataRouter?.routerDelegate != null || routerDelegate != null);

      return CupertinoApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser!,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate!,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        theme: dataRouter?.theme,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.key ?? key,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery: dataRouter?.useInheritedMediaQuery ??
            useInheritedMediaQuery ??
            false,
      );
    } else {
      final data = cupertino?.call(context, os(context));
      return CupertinoApp(
        key: data?.key ?? key,
        navigatorKey: data?.navKey ?? navKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: data?.theme,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
        useInheritedMediaQuery:
            data?.useInheritedMediaQuery ?? useInheritedMediaQuery ?? false,
      );
    }
  }

  @override
  FluentApp createFluentWidget(BuildContext context) {
    final dataRouter = fluentRouter?.call(context, os(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null) {
      assert(dataRouter?.routerDelegate != null || routerDelegate != null);
      return FluentApp.router(
        key: dataRouter?.key ?? key,
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        theme: dataRouter?.theme,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ??
            color ??
            mat.Theme.of(context).colorScheme.secondary,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            defaultSupportedLocales,
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: dataRouter?.scrollBehavior ??
            scrollBehavior ??
            const FluentScrollBehavior(),
        useInheritedMediaQuery: dataRouter?.useInheritedMediaQuery ??
            useInheritedMediaQuery ??
            false,
      );
    } else {
      final data = fluent?.call(context, os(context));
      return FluentApp(
        key: data?.key ?? key,
        navigatorKey: data?.navKey ?? navKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            defaultSupportedLocales,
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scrollBehavior: data?.scrollBehavior ??
            scrollBehavior ??
            const FluentScrollBehavior(),
        useInheritedMediaQuery:
            data?.useInheritedMediaQuery ?? useInheritedMediaQuery ?? false,
      );
    }
  }
}
