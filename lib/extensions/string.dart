// ignore_for_file: unused_element

extension CapitalizeString on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}

extension LimitLength on String {
  String limitLength(int maxLength) =>
      (length <= maxLength) ? this : substring(0, maxLength);
}
