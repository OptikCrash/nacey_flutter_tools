import 'package:intl/intl.dart';

extension DateString on DateTime {
  String get toHumanReadableDate => '$month/$day/$year';
}

extension StringDate on String {
  DateTime get monthDayYearToDate => DateFormat('M/d/yyyy').parse(this);
}

extension DateFormatted on DateTime {
  String format(String format) {
    switch (format) {
      case "MM":
        return '$month'.padLeft(2, '0');
      case "DD":
        return '$day'.padLeft(2, '0');
      case "YYYY":
        return '$year'.padLeft(2, '0');
      case "hh":
        return '$hour'.padLeft(2, '0');
      case "mm":
        return '$minute'.padLeft(2, '0');
      case 'ss':
        return '$second'.padLeft(2, '0');
      case 'MM/DD/YYYY':
        return '$month'.padLeft(2, '0') +
            '/' +
            '$day'.padLeft(2, '0') +
            '/' +
            '$year'.padLeft(2, '0');
      case 'hh:mm':
        return '$hour:' + '$minute'.padLeft(2, '0');
      case 'hh:mm:ss':
        return '$hour'.padLeft(2, '0') +
            ':' +
            '$minute'.padLeft(2, '0') +
            ':' +
            '$second'.padLeft(2, '0');
      case 'MM/DD/YYYY hh:mm:ss':
        return '$month'.padLeft(2, '0') +
            '/' +
            '$day'.padLeft(2, '0') +
            '/' +
            '$year ' +
            '$hour'.padLeft(2, '0') +
            ':' +
            '$minute'.padLeft(2, '0') +
            ':' +
            '$second'.padLeft(2, '0');
    }
    return '';
  }
}
