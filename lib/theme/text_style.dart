import 'package:flutter/material.dart';

const TextStyle txtRoboto = TextStyle(fontFamily: 'Roboto');
const TextStyle txtFluent = TextStyle(fontFamily: 'Segoe');
const TextStyle txtMacOS = TextStyle(fontFamily: 'SanFrancisco-Pro');
const TextStyle txtIos = TextStyle(fontFamily: 'SanFrancisco-Compact');

class RobotoTxtTheme extends TextTheme {
  @override
  TextStyle? get displayLarge =>
      super.displayLarge?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get displayMedium =>
      super.displayMedium?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get displaySmall =>
      super.displaySmall?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headlineLarge =>
      super.headlineLarge?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headlineMedium =>
      super.headlineMedium?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headlineSmall =>
      super.headlineSmall?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get titleLarge => super.titleLarge?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get titleMedium =>
      super.titleMedium?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get titleSmall => super.titleSmall?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get bodyLarge => super.bodyLarge?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get bodyMedium => super.bodyMedium?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get bodySmall => super.bodySmall?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get labelLarge => super.labelLarge?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get labelMedium =>
      super.labelMedium?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get labelSmall => super.labelSmall?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline1 => super.headline1?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline2 => super.headline2?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline3 => super.headline3?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline4 => super.headline4?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline5 => super.headline5?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get headline6 => super.headline6?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get subtitle1 => super.subtitle1?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get subtitle2 => super.subtitle2?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get bodyText1 => super.bodyText1?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get bodyText2 => super.bodyText2?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get caption => super.caption?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get button => super.button?.copyWith(fontFamily: 'Roboto');
  @override
  TextStyle? get overline => super.overline?.copyWith(fontFamily: 'Roboto');
}

class FluentTxtTheme extends TextTheme {
  @override
  TextStyle? get displayLarge =>
      super.displayLarge?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get displayMedium =>
      super.displayMedium?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get displaySmall =>
      super.displaySmall?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headlineLarge =>
      super.headlineLarge?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headlineMedium =>
      super.headlineMedium?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headlineSmall =>
      super.headlineSmall?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get titleLarge => super.titleLarge?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get titleMedium =>
      super.titleMedium?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get titleSmall => super.titleSmall?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get bodyLarge => super.bodyLarge?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get bodyMedium => super.bodyMedium?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get bodySmall => super.bodySmall?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get labelLarge => super.labelLarge?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get labelMedium =>
      super.labelMedium?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get labelSmall => super.labelSmall?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline1 => super.headline1?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline2 => super.headline2?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline3 => super.headline3?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline4 => super.headline4?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline5 => super.headline5?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get headline6 => super.headline6?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get subtitle1 => super.subtitle1?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get subtitle2 => super.subtitle2?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get bodyText1 => super.bodyText1?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get bodyText2 => super.bodyText2?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get caption => super.caption?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get button => super.button?.copyWith(fontFamily: 'Segoe');
  @override
  TextStyle? get overline => super.overline?.copyWith(fontFamily: 'Segoe');
}

class CupertinoProTxtTheme extends TextTheme {
  @override
  TextStyle? get displayLarge =>
      super.displayLarge?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get displayMedium =>
      super.displayMedium?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get displaySmall =>
      super.displaySmall?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headlineLarge =>
      super.headlineLarge?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headlineMedium =>
      super.headlineMedium?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headlineSmall =>
      super.headlineSmall?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get titleLarge =>
      super.titleLarge?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get titleMedium =>
      super.titleMedium?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get titleSmall =>
      super.titleSmall?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get bodyLarge =>
      super.bodyLarge?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get bodyMedium =>
      super.bodyMedium?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get bodySmall =>
      super.bodySmall?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get labelLarge =>
      super.labelLarge?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get labelMedium =>
      super.labelMedium?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get labelSmall =>
      super.labelSmall?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline1 =>
      super.headline1?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline2 =>
      super.headline2?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline3 =>
      super.headline3?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline4 =>
      super.headline4?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline5 =>
      super.headline5?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get headline6 =>
      super.headline6?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get subtitle1 =>
      super.subtitle1?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get subtitle2 =>
      super.subtitle2?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get bodyText1 =>
      super.bodyText1?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get bodyText2 =>
      super.bodyText2?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get caption =>
      super.caption?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get button =>
      super.button?.copyWith(fontFamily: 'SanFrancisco-Pro');
  @override
  TextStyle? get overline =>
      super.overline?.copyWith(fontFamily: 'SanFrancisco-Pro');
}

class CupertinoCompactTheme extends TextTheme {
  @override
  TextStyle? get displayLarge =>
      super.displayLarge?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get displayMedium =>
      super.displayMedium?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get displaySmall =>
      super.displaySmall?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headlineLarge =>
      super.headlineLarge?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headlineMedium =>
      super.headlineMedium?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headlineSmall =>
      super.headlineSmall?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get titleLarge =>
      super.titleLarge?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get titleMedium =>
      super.titleMedium?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get titleSmall =>
      super.titleSmall?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get bodyLarge =>
      super.bodyLarge?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get bodyMedium =>
      super.bodyMedium?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get bodySmall =>
      super.bodySmall?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get labelLarge =>
      super.labelLarge?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get labelMedium =>
      super.labelMedium?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get labelSmall =>
      super.labelSmall?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline1 =>
      super.headline1?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline2 =>
      super.headline2?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline3 =>
      super.headline3?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline4 =>
      super.headline4?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline5 =>
      super.headline5?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get headline6 =>
      super.headline6?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get subtitle1 =>
      super.subtitle1?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get subtitle2 =>
      super.subtitle2?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get bodyText1 =>
      super.bodyText1?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get bodyText2 =>
      super.bodyText2?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get caption =>
      super.caption?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get button =>
      super.button?.copyWith(fontFamily: 'SanFrancisco-Compact');
  @override
  TextStyle? get overline =>
      super.overline?.copyWith(fontFamily: 'SanFrancisco-Compact');
}
