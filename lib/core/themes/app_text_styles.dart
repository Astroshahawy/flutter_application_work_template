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
      fontWeight: weight ?? FontWeightHelper.regular,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: isDecorated! ? TextDecoration.lineThrough : null,
      shadows: shadow,
      decorationColor: isDecorated ? AppLightColors.black : null,
    );
  }
}

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
