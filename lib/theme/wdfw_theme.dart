import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nacey_flutter_tools/theme/wdfw/wdfw_colors.dart';

import 'themes.dart';

export 'wdfw/wdfw.dart';

class WDFWTheme extends Theme {
  WDFWTheme({
    Key? key,
    required Widget child,
  }) : super(key: key, data: lightTheme, child: child);

  static ThemeData light() => lightTheme;

  static ThemeData dark() => darkTheme;

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: wdfwGreen500,
        primaryColorLight: wdfwGreen100,
        primaryColorDark: wdfwGreen700,
        toggleableActiveColor: wdfwYellow600,
        brightness: Brightness.light,
        visualDensity: ThemeData.light().visualDensity,
        canvasColor: wdfwGreyCool100,
        shadowColor: ThemeData.light().shadowColor,
        scaffoldBackgroundColor: wdfwGreyCool50,
        bottomAppBarColor: ThemeData.light().bottomAppBarColor,
        cardColor: wdfwGreyCool50,
        dividerColor: wdfwYellow900,
        focusColor: ThemeData.light().focusColor,
        hoverColor: ThemeData.light().hoverColor,
        highlightColor: ThemeData.light().highlightColor,
        splashColor: ThemeData.light().splashColor,
        splashFactory: ThemeData.light().splashFactory,
        selectedRowColor: ThemeData.light().selectedRowColor,
        unselectedWidgetColor: ThemeData.light().unselectedWidgetColor,
        disabledColor: ThemeData.light().disabledColor,
        buttonTheme: ThemeData.light().buttonTheme,
        toggleButtonsTheme: ThemeData.light().toggleButtonsTheme,
        secondaryHeaderColor: ThemeData.light().secondaryHeaderColor,
        backgroundColor: Colors.white,
        dialogBackgroundColor: ThemeData.light().dialogBackgroundColor,
        indicatorColor: ThemeData.light().indicatorColor,
        hintColor: ThemeData.light().hintColor,
        errorColor: ThemeData.light().errorColor,
        textTheme: TextTheme(
          headline1: const TextStyle(color: wdfwGreyCool50),
          headline2: ThemeData.light().textTheme.headline2,
          headline3:
              GoogleFonts.getFont('Montserrat Alternates', color: wdfwGreen300),
          headline4: GoogleFonts.getFont(
            'Oswald',
            textStyle: const TextStyle(
              color: wdfwGreen300,
            ),
          ),
          headline5: GoogleFonts.getFont('Oswald',
              textStyle: const TextStyle(color: wdfwGreen500)),
          headline6: GoogleFonts.getFont('Montserrat Alternates',
              textStyle: const TextStyle(color: wdfwGreyCool700)),
          subtitle1: ThemeData.light().textTheme.subtitle1,
          subtitle2: ThemeData.light().textTheme.subtitle2,
          bodyText1: GoogleFonts.getFont('Montserrat',
              textStyle: const TextStyle(color: wdfwGreyCool900)),
          bodyText2: GoogleFonts.getFont('Montserrat',
              textStyle:
                  const TextStyle(color: wdfwGreyCool900, fontSize: 16.0)),
          caption: ThemeData.light().textTheme.caption,
          button: ThemeData.light().textTheme.button,
          overline: ThemeData.light().textTheme.overline,
        ),
        primaryTextTheme: ThemeData.light().primaryTextTheme,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: wdfwGreyCool100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: wdfwGreen700,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
        ),
        iconTheme: ThemeData.light().iconTheme,
        primaryIconTheme: ThemeData.light().primaryIconTheme,
        sliderTheme: SliderThemeData(
            trackHeight: ThemeData.light().sliderTheme.trackHeight,
            activeTrackColor: Colors.greenAccent,
            inactiveTrackColor:
                ThemeData.light().sliderTheme.inactiveTrackColor,
            disabledActiveTrackColor:
                ThemeData.light().sliderTheme.disabledActiveTrackColor,
            disabledInactiveTrackColor:
                ThemeData.light().sliderTheme.disabledInactiveTrackColor,
            activeTickMarkColor:
                ThemeData.light().sliderTheme.activeTickMarkColor,
            inactiveTickMarkColor:
                ThemeData.light().sliderTheme.inactiveTickMarkColor,
            disabledActiveTickMarkColor:
                ThemeData.light().sliderTheme.disabledActiveTickMarkColor,
            disabledInactiveTickMarkColor:
                ThemeData.light().sliderTheme.disabledInactiveTickMarkColor,
            thumbColor: const CupertinoDynamicColor(
              debugLabel: 'thumbColorCupertinoDynamicColor',
              color: wdfwGreen700,
              darkColor: wdfwGreen700,
              highContrastColor: wdfwGreen700,
              darkHighContrastColor: wdfwGreen700,
              elevatedColor: wdfwGreen700,
              darkElevatedColor: wdfwGreen700,
              highContrastElevatedColor: wdfwGreen700,
              darkHighContrastElevatedColor: wdfwGreen700,
            ),
            overlappingShapeStrokeColor:
                ThemeData.light().sliderTheme.overlappingShapeStrokeColor,
            disabledThumbColor:
                ThemeData.light().sliderTheme.disabledThumbColor,
            overlayColor: ThemeData.light().sliderTheme.overlayColor,
            valueIndicatorColor:
                ThemeData.light().sliderTheme.valueIndicatorColor,
            overlayShape: ThemeData.light().sliderTheme.overlayShape,
            tickMarkShape: ThemeData.light().sliderTheme.tickMarkShape,
            thumbShape: ThemeData.light().sliderTheme.thumbShape,
            trackShape: ThemeData.light().sliderTheme.trackShape,
            valueIndicatorShape:
                ThemeData.light().sliderTheme.valueIndicatorShape,
            rangeTickMarkShape:
                ThemeData.light().sliderTheme.rangeTickMarkShape,
            rangeThumbShape: ThemeData.light().sliderTheme.rangeThumbShape,
            rangeTrackShape: ThemeData.light().sliderTheme.rangeTrackShape,
            rangeValueIndicatorShape:
                ThemeData.light().sliderTheme.rangeValueIndicatorShape,
            showValueIndicator:
                ThemeData.light().sliderTheme.showValueIndicator,
            valueIndicatorTextStyle:
                ThemeData.light().sliderTheme.valueIndicatorTextStyle,
            minThumbSeparation:
                ThemeData.light().sliderTheme.minThumbSeparation,
            thumbSelector: ThemeData.light().sliderTheme.thumbSelector),
        tabBarTheme: ThemeData.light().tabBarTheme,
        tooltipTheme: ThemeData.light().tooltipTheme,
        cardTheme: ThemeData.light().cardTheme,
        chipTheme: ThemeData.light().chipTheme,
        platform: ThemeData.light().platform,
        materialTapTargetSize: ThemeData.light().materialTapTargetSize,
        applyElevationOverlayColor:
            ThemeData.light().applyElevationOverlayColor,
        pageTransitionsTheme: ThemeData.light().pageTransitionsTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: wdfwGreyCool300,
        ),
        scrollbarTheme: ThemeData.light().scrollbarTheme,
        dialogTheme: ThemeData.light().dialogTheme,
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme,
        navigationRailTheme: ThemeData.light().navigationRailTheme,
        typography: ThemeData.light().typography,
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: wdfwGreen,
          primaryContrastingColor: wdfwGreyCool50,
          // textTheme:
          barBackgroundColor: wdfwGreyWarm50,
          scaffoldBackgroundColor: Colors.transparent,
        ),
        snackBarTheme: ThemeData.light().snackBarTheme,
        popupMenuTheme: ThemeData.light().popupMenuTheme,
        bannerTheme: ThemeData.light().bannerTheme,
        dividerTheme: ThemeData.light().dividerTheme,
        buttonBarTheme: ThemeData.light().buttonBarTheme,
        bottomSheetTheme: ThemeData.light().bottomSheetTheme,
        bottomAppBarTheme: const BottomAppBarTheme(color: wdfwGreyCool300),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: wdfwGreen500,
            opacity: 100.0,
            size: 24.0,
          ),
          selectedItemColor: wdfwGreen500,
          unselectedIconTheme: IconThemeData(
            color: wdfwGreyWarm300,
            opacity: 100.0,
            size: 36.0,
          ),
          unselectedItemColor: wdfwGreyWarm300,
        ),
        timePickerTheme: ThemeData.light().timePickerTheme,
        textButtonTheme: ThemeData.light().textButtonTheme,
        elevatedButtonTheme: ThemeData.light().elevatedButtonTheme,
        outlinedButtonTheme: ThemeData.light().outlinedButtonTheme,
        textSelectionTheme: ThemeData.light().textSelectionTheme,
        dataTableTheme: ThemeData.light().dataTableTheme,
        checkboxTheme: ThemeData.light().checkboxTheme,
        radioTheme: ThemeData.light().radioTheme,
        switchTheme: ThemeData.light().switchTheme,
        progressIndicatorTheme: ThemeData.light().progressIndicatorTheme,
      )..addTheme(WDFWFields(
          sliverTopperColor: wdfwGreen500,
          iosSystemBlue: iosSystemBlue,
          iosSystemGreen: iosSystemGreen,
          iosSystemIndigo: iosSystemIndigo,
          iosSystemOrange: iosSystemOrange,
          iosSystemPink: iosSystemPink,
          iosSystemPurple: iosSystemPurple,
          iosSystemRed: iosSystemRed,
          iosSystemTeal: iosSystemTeal,
          iosSystemYellow: iosSystemYellow,
          iosSystemGray: iosSystemGray,
          iosSystemGray2: iosSystemGray2,
          iosSystemGray3: iosSystemGray3,
          iosSystemGray4: iosSystemGray4,
          iosSystemGray5: iosSystemGray5,
          iosSystemGray6: iosSystemGray6,
        ));

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: wdfwGreen300,
        primaryColorLight: wdfwGreen100,
        primaryColorDark: wdfwGreen700,
        toggleableActiveColor: wdfwYellow600,
        brightness: Brightness.dark,
        visualDensity: ThemeData.dark().visualDensity,
        canvasColor: wdfwGreyWarm900,
        shadowColor: ThemeData.dark().shadowColor,
        scaffoldBackgroundColor: const Color(0xC7252525),
        bottomAppBarColor: ThemeData.dark().bottomAppBarColor,
        cardColor: Colors.black,
        dividerColor: wdfwRust900,
        focusColor: ThemeData.dark().focusColor,
        hoverColor: ThemeData.dark().hoverColor,
        highlightColor: ThemeData.dark().highlightColor,
        splashColor: ThemeData.dark().splashColor,
        splashFactory: ThemeData.dark().splashFactory,
        selectedRowColor: ThemeData.dark().selectedRowColor,
        unselectedWidgetColor: ThemeData.dark().unselectedWidgetColor,
        disabledColor: ThemeData.dark().disabledColor,
        buttonTheme: ThemeData.dark().buttonTheme,
        toggleButtonsTheme: ThemeData.dark().toggleButtonsTheme,
        secondaryHeaderColor: ThemeData.dark().secondaryHeaderColor,
        backgroundColor: Colors.black87,
        dialogBackgroundColor: ThemeData.dark().dialogBackgroundColor,
        indicatorColor: ThemeData.dark().indicatorColor,
        hintColor: ThemeData.dark().hintColor,
        errorColor: ThemeData.dark().errorColor,
        textTheme: TextTheme(
          headline1: const TextStyle(color: wdfwGreyCool50),
          headline2: ThemeData.dark().textTheme.headline2,
          headline3:
              GoogleFonts.getFont('Montserrat Alternates', color: wdfwGreen300),
          headline4: GoogleFonts.getFont(
            'Oswald',
            textStyle: const TextStyle(
              color: wdfwGreen300,
            ),
          ),
          headline5: GoogleFonts.getFont('Oswald',
              textStyle: const TextStyle(color: wdfwGreen400)),
          headline6: GoogleFonts.getFont('Montserrat Alternates',
              textStyle: const TextStyle(color: wdfwGreyCool50)),
          subtitle1: ThemeData.dark().textTheme.headline3,
          subtitle2: ThemeData.dark().textTheme.subtitle1,
          bodyText1: GoogleFonts.getFont('Montserrat',
              textStyle: const TextStyle(color: wdfwGreyCool200)),
          bodyText2: GoogleFonts.getFont('Montserrat',
              textStyle:
                  const TextStyle(color: wdfwGreyCool200, fontSize: 16.0)),
          caption: ThemeData.dark().textTheme.bodyText2,
          button: ThemeData.dark().textTheme.caption,
          overline: ThemeData.dark().textTheme.button,
        ),
        primaryTextTheme: ThemeData.dark().primaryTextTheme,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(
              color: wdfwYellow900,
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
        ),
        iconTheme: ThemeData.dark().iconTheme,
        primaryIconTheme: ThemeData.dark().primaryIconTheme,
        sliderTheme: SliderThemeData(
            trackHeight: ThemeData.dark().sliderTheme.trackHeight,
            activeTrackColor: Colors.greenAccent,
            inactiveTrackColor: ThemeData.dark().sliderTheme.inactiveTrackColor,
            disabledActiveTrackColor:
                ThemeData.dark().sliderTheme.disabledActiveTrackColor,
            disabledInactiveTrackColor:
                ThemeData.dark().sliderTheme.disabledInactiveTrackColor,
            activeTickMarkColor:
                ThemeData.dark().sliderTheme.activeTickMarkColor,
            inactiveTickMarkColor:
                ThemeData.dark().sliderTheme.inactiveTickMarkColor,
            disabledActiveTickMarkColor:
                ThemeData.dark().sliderTheme.disabledActiveTickMarkColor,
            disabledInactiveTickMarkColor:
                ThemeData.dark().sliderTheme.disabledInactiveTickMarkColor,
            thumbColor: const CupertinoDynamicColor(
              debugLabel: 'thumbColorCupertinoDynamicColor',
              color: wdfwGreen300,
              darkColor: wdfwGreen300,
              highContrastColor: wdfwGreen300,
              darkHighContrastColor: wdfwGreen300,
              elevatedColor: wdfwGreen300,
              darkElevatedColor: wdfwGreen300,
              highContrastElevatedColor: wdfwGreen300,
              darkHighContrastElevatedColor: wdfwGreen300,
            ),
            overlappingShapeStrokeColor:
                ThemeData.dark().sliderTheme.overlappingShapeStrokeColor,
            disabledThumbColor: ThemeData.dark().sliderTheme.disabledThumbColor,
            overlayColor: Colors.purple,
            valueIndicatorColor: Colors.red,
            overlayShape: ThemeData.dark().sliderTheme.overlayShape,
            tickMarkShape: ThemeData.dark().sliderTheme.tickMarkShape,
            thumbShape: ThemeData.dark().sliderTheme.thumbShape,
            trackShape: ThemeData.dark().sliderTheme.trackShape,
            valueIndicatorShape:
                ThemeData.dark().sliderTheme.valueIndicatorShape,
            rangeTickMarkShape: ThemeData.dark().sliderTheme.rangeTickMarkShape,
            rangeThumbShape: ThemeData.dark().sliderTheme.rangeThumbShape,
            rangeTrackShape: ThemeData.dark().sliderTheme.rangeTrackShape,
            rangeValueIndicatorShape:
                ThemeData.dark().sliderTheme.rangeValueIndicatorShape,
            showValueIndicator: ThemeData.dark().sliderTheme.showValueIndicator,
            valueIndicatorTextStyle:
                ThemeData.dark().sliderTheme.valueIndicatorTextStyle,
            minThumbSeparation: ThemeData.dark().sliderTheme.minThumbSeparation,
            thumbSelector: ThemeData.dark().sliderTheme.thumbSelector),
        tabBarTheme: ThemeData.dark().tabBarTheme,
        tooltipTheme: ThemeData.dark().tooltipTheme,
        cardTheme: ThemeData.dark().cardTheme,
        chipTheme: ThemeData.dark().chipTheme,
        platform: ThemeData.dark().platform,
        materialTapTargetSize: ThemeData.dark().materialTapTargetSize,
        applyElevationOverlayColor: ThemeData.dark().applyElevationOverlayColor,
        pageTransitionsTheme: ThemeData.dark().pageTransitionsTheme,
        appBarTheme: ThemeData.dark().appBarTheme,
        scrollbarTheme: ThemeData.dark().scrollbarTheme,
        bottomAppBarTheme: ThemeData.dark().bottomAppBarTheme,
        dialogTheme: DialogTheme(
            titleTextStyle:
                GoogleFonts.getFont('Montserrat Alternates', fontSize: 26)),
        floatingActionButtonTheme: ThemeData.dark().floatingActionButtonTheme,
        navigationRailTheme: ThemeData.dark().navigationRailTheme,
        typography: ThemeData.dark().typography,
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          primaryColor: wdfwGreen300,
          primaryContrastingColor: wdfwGreyCool50,
          textTheme: CupertinoTextThemeData(
            primaryColor: Colors.red,
            textStyle:
                ThemeData.dark().cupertinoOverrideTheme?.textTheme?.textStyle,
            actionTextStyle: ThemeData.dark()
                .cupertinoOverrideTheme
                ?.textTheme
                ?.actionTextStyle,
            tabLabelTextStyle: ThemeData.dark()
                .cupertinoOverrideTheme
                ?.textTheme
                ?.tabLabelTextStyle,
            navTitleTextStyle:
                const TextStyle(color: wdfwGreyCool50, fontSize: 24),
            navLargeTitleTextStyle: ThemeData.dark()
                .cupertinoOverrideTheme
                ?.textTheme
                ?.navLargeTitleTextStyle,
            navActionTextStyle: ThemeData.dark()
                .cupertinoOverrideTheme
                ?.textTheme
                ?.navActionTextStyle,
            pickerTextStyle: ThemeData.dark()
                .cupertinoOverrideTheme
                ?.textTheme
                ?.pickerTextStyle,
            dateTimePickerTextStyle: GoogleFonts.getFont('Oswald',
                fontSize: 24, color: wdfwGreen700),
          ),
          barBackgroundColor: wdfwGreyWarm900,
          // scaffoldBackgroundColor: ,
        ),
        snackBarTheme: ThemeData.dark().snackBarTheme,
        bottomSheetTheme: ThemeData.dark().bottomSheetTheme,
        popupMenuTheme: ThemeData.dark().popupMenuTheme,
        bannerTheme: ThemeData.dark().bannerTheme,
        dividerTheme: ThemeData.dark().dividerTheme,
        buttonBarTheme: ThemeData.dark().buttonBarTheme,
        bottomNavigationBarTheme: ThemeData.dark().bottomNavigationBarTheme,
        timePickerTheme: ThemeData.dark().timePickerTheme,
        textButtonTheme: ThemeData.dark().textButtonTheme,
        elevatedButtonTheme: ThemeData.dark().elevatedButtonTheme,
        outlinedButtonTheme: ThemeData.dark().outlinedButtonTheme,
        textSelectionTheme: ThemeData.dark().textSelectionTheme,
        dataTableTheme: ThemeData.dark().dataTableTheme,
        checkboxTheme: ThemeData.dark().checkboxTheme,
        radioTheme: ThemeData.dark().radioTheme,
        switchTheme: ThemeData.dark().switchTheme,
        progressIndicatorTheme: ThemeData.dark().progressIndicatorTheme,
      )..addTheme(WDFWFields(
          sliverTopperColor: wdfwGreyWarm900,
          iosSystemBlue: iosSystemBlueNight,
          iosSystemGreen: iosSystemGreenNight,
          iosSystemIndigo: iosSystemIndigoNight,
          iosSystemOrange: iosSystemOrangeNight,
          iosSystemPink: iosSystemPinkNight,
          iosSystemPurple: iosSystemPurpleNight,
          iosSystemRed: iosSystemRedNight,
          iosSystemTeal: iosSystemTealNight,
          iosSystemYellow: iosSystemYellowNight,
          iosSystemGray: iosSystemGrayNight,
          iosSystemGray2: iosSystemGray2Night,
          iosSystemGray3: iosSystemGray3Night,
          iosSystemGray4: iosSystemGray4Night,
          iosSystemGray5: iosSystemGray5Night,
          iosSystemGray6: iosSystemGray6Night,
        ));

  static ThemeData get fallback => lightTheme;
}

CustomThemeFields wdfwTheme(BuildContext context) => Theme.of(context).themed;

class WDFWFields extends CustomThemeFields {
  late final Color sliverTopperColor;

  WDFWFields({
    Color? sliverTopperColor,
    Color? iosSystemBlue,
    Color? iosSystemGreen,
    Color? iosSystemIndigo,
    Color? iosSystemOrange,
    Color? iosSystemPink,
    Color? iosSystemPurple,
    Color? iosSystemRed,
    Color? iosSystemTeal,
    Color? iosSystemYellow,
    Color? iosSystemGray,
    Color? iosSystemGray2,
    Color? iosSystemGray3,
    Color? iosSystemGray4,
    Color? iosSystemGray5,
    Color? iosSystemGray6,
    Color? fireEngineRed,
    Color? stopSignRed,
    Color? xMasGreen,
  })  : sliverTopperColor = sliverTopperColor ?? Colors.pink,
        super(
          iosSystemBlue: iosSystemBlue,
          iosSystemGreen: iosSystemGreen,
          iosSystemIndigo: iosSystemIndigo,
          iosSystemOrange: iosSystemOrange,
          iosSystemPink: iosSystemPink,
          iosSystemPurple: iosSystemPurple,
          iosSystemRed: iosSystemRed,
          iosSystemTeal: iosSystemTeal,
          iosSystemYellow: iosSystemYellow,
          iosSystemGray: iosSystemGray,
          iosSystemGray2: iosSystemGray2,
          iosSystemGray3: iosSystemGray3,
          iosSystemGray4: iosSystemGray4,
          iosSystemGray5: iosSystemGray5,
          iosSystemGray6: iosSystemGray6,
        );
}
