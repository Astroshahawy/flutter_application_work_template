import '../src/app_export.dart';

class AppTextStyles {
  static TextStyle textStyle({
    Color? color,
    double? size,
    String? family,
    FontWeight? weight,
    List<Shadow>? shadow,
    double height = 1,
    bool? isDecorated = false,
    bool? isItalic = false,
  }) {
    return TextStyle(
      color: color ?? AppLightColors.black,
      fontSize: (size ?? 14).sp,
      fontFamily: family ?? 'Outfit',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: isDecorated! ? TextDecoration.lineThrough : null,
      shadows: shadow,
      decorationColor: isDecorated ? AppLightColors.black : null,
    );
  }
}
