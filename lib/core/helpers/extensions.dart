import '../src/app_export.dart';

extension StringCapitalize on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension StringReverse on String {
  String reverse() {
    return split('').reversed.join();
  }
}

extension StringWords on String {
  int countWords() {
    var words = split(RegExp(r'\s+'));
    return words.where((w) => w.isNotEmpty).length;
  }
}

extension StringEmail on String {
  bool isEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension StringPhoneNumber on String {
  bool isPhoneNumber() {
    // regular expression to match phone number
    final phoneNumberRegex = RegExp(
        r'^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$');
    return phoneNumberRegex.hasMatch(this);
  }
}

extension StringNumeric on String {
  bool isNumeric() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}

extension StringAlpha on String {
  bool isAlpha() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }
}

extension ConvertFlag on String {
  String get toFlag {
    return (this).toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) =>
              String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
        );
  }
}

extension StringAscii on String {
  bool isAscii() {
    return RegExp(r'^[\x00-\x7F]+$').hasMatch(this);
  }
}

extension ToEnglishNumber on String {
  String toEnglish() {
    return replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9');
  }
}

extension DateOfBirthExtension on String {
  int? calculateAge() {
    try {
      DateTime dob = DateTime.parse(this);
      DateTime now = DateTime.now();
      int age = now.year - dob.year;
      if (now.month < dob.month ||
          (now.month == dob.month && now.day < dob.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return null;
    }
  }
}

extension TimerTextExtension on int {
  String toTimerText() {
    final minutes = (this ~/ 60).toString().padLeft(1, '0');
    final seconds = (this % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

extension StyledText<T extends Text> on T {
  Text copyWith({
    String? data,
    TextStyle? style,
  }) =>
      Text(
        data ?? this.data ?? '',
        style: style ?? this.style,
      );

  T exTextStyle([TextStyle? style]) => copyWith(
        style: (this.style ?? AppTextStyles.textStyle()).copyWith(
          background: style?.background,
          backgroundColor: style?.backgroundColor,
          color: style?.color,
          debugLabel: style?.debugLabel,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          fontFeatures: style?.fontFeatures,
          fontSize: style?.fontSize,
          fontStyle: style?.fontStyle,
          fontWeight: style?.fontWeight,
          foreground: style?.foreground,
          height: style?.height,
          inherit: style?.inherit,
          letterSpacing: style?.letterSpacing,
          locale: style?.locale,
          shadows: style?.shadows,
          textBaseline: style?.textBaseline,
          wordSpacing: style?.wordSpacing,
        ),
      ) as T;
  T exBold() => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ) as T;

  T exItalic() => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      ) as T;

  T exFontWeight(FontWeight fontWeight) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      ) as T;

  T exFontSize(double size) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          fontSize: size,
        ),
      ) as T;

  T exFontFamily(String font) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          fontFamily: font,
        ),
      ) as T;

  T exLetterSpacing(double space) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          letterSpacing: space,
        ),
      ) as T;

  T exWordSpacing(double space) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          wordSpacing: space,
        ),
      ) as T;

  T exTextColor(Color color) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          color: color,
        ),
      ) as T;

  T exTextBaseline(TextBaseline textBaseline) => copyWith(
        style: (style ?? AppTextStyles.textStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      ) as T;

  T exWithUnderLine() => copyWith(
        style: (style ?? AppTextStyles.textStyle())
            .copyWith(decoration: TextDecoration.underline),
      ) as T;
}

extension PaddingEx on Widget {
  Padding paddingAll(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.only(
          top: top,
          left: left,
          bottom: bottom,
          right: right,
        ),
        child: this,
      );

  Padding paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
}

extension DateTimeToday on DateTime {
  bool isToday() {
    DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

extension DateTimeTimeAgo on DateTime {
  String timeAgo() {
    Duration duration = DateTime.now().difference(this);
    if (duration.inDays >= 365) {
      int years = (duration.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
    if (duration.inDays >= 30) {
      int months = (duration.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    }
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''} ago';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''} ago';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minute${duration.inMinutes > 1 ? 's' : ''} ago';
    }
    if (duration.inSeconds > 0) {
      return '${duration.inSeconds} second${duration.inSeconds > 1 ? 's' : ''} ago';
    }
    return 'Just now';
  }
}

extension ListSorted on List {
  bool isSorted() {
    for (int i = 0; i < length - 1; i++) {
      if (this[i] > this[i + 1]) {
        return false;
      }
    }
    return true;
  }
}
