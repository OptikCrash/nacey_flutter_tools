export 'colors.dart';

import 'package:flutter/material.dart';

export 'wdfw_theme.dart' show WDFWTheme, wdfwTheme, WDFWFields;
export 'colors.dart';

extension ThemeDataExtension on ThemeData {
  static final Map<InputDecorationTheme, CustomThemeFields> _custom = {};

  void addTheme(CustomThemeFields custom) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _custom[inputDecorationTheme] = custom;
  }

  static CustomThemeFields? empty;

  CustomThemeFields get themed {
    var x = _custom[inputDecorationTheme];
    if (x == null) {
      empty ??= CustomThemeFields();
      x = empty;
    }
    return x!;
  }
}

class CustomThemeFields {
  final Color iosSystemBlue;
  final Color iosSystemGreen;
  final Color iosSystemIndigo;
  final Color iosSystemOrange;
  final Color iosSystemPink;
  final Color iosSystemPurple;
  final Color iosSystemRed;
  final Color iosSystemTeal;
  final Color iosSystemYellow;
  final Color iosSystemGray;
  final Color iosSystemGray2;
  final Color iosSystemGray3;
  final Color iosSystemGray4;
  final Color iosSystemGray5;
  final Color iosSystemGray6;
  final Color twitterBlue;

  CustomThemeFields({
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
    Color? twitterBlue,
  })  : iosSystemBlue = iosSystemBlue ?? Colors.blue,
        iosSystemGreen = iosSystemGreen ?? Colors.green,
        iosSystemIndigo = iosSystemIndigo ?? Colors.indigo,
        iosSystemOrange = iosSystemOrange ?? Colors.orange,
        iosSystemPink = iosSystemPink ?? Colors.pink,
        iosSystemPurple = iosSystemPurple ?? Colors.purple,
        iosSystemRed = iosSystemRed ?? Colors.red,
        iosSystemTeal = iosSystemTeal ?? Colors.teal,
        iosSystemYellow = iosSystemYellow ?? Colors.yellow,
        iosSystemGray = iosSystemGray ?? Colors.grey,
        iosSystemGray2 = iosSystemGray2 ?? Colors.grey,
        iosSystemGray3 = iosSystemGray3 ?? Colors.grey,
        iosSystemGray4 = iosSystemGray4 ?? Colors.blueGrey,
        iosSystemGray5 = iosSystemGray5 ?? Colors.blueGrey,
        iosSystemGray6 = iosSystemGray6 ?? Colors.blueGrey,
        twitterBlue = twitterBlue ?? const Color(0xff55acee);
}
