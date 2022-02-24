part of 'app_theme.dart';

class TextAppTheme {
  static void setterColorScheme(ColorScheme colorScheme) =>
      _colorScheme = colorScheme;

  static late ColorScheme _colorScheme;
  static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static TextStyle textStyle = const TextStyle(
    fontSize: 14,
    fontWeight: _semiBold,
    // color: _colorScheme.primary
  );
  static final TextTheme textTheme = TextTheme(
    headline1: textStyle.copyWith(fontSize: 32, fontWeight: _bold),
    headline2: textStyle.copyWith(fontSize: 24, fontWeight: _bold),
    headline3: textStyle.copyWith(
      fontSize: 12,
    ),
    subtitle1: textStyle.copyWith(fontSize: 18),
    subtitle2: textStyle.copyWith(fontSize: 16),
    bodyText1: textStyle,
    bodyText2: textStyle.copyWith(fontWeight: _regular),
    button: textStyle.copyWith(fontSize: 16),
  );
}
