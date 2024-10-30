extension StringCapitalize on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
