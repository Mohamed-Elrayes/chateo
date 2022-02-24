part of 'app_theme.dart';

class AppColors {
  static const Color darkButtonColor = Color(0xFF001A83);
  static const Color buttonColor = Color(0xFF375FFF);
  static const Color variantColor = Color(0XFF879FFF);
  static const Color activeColorFont = Color(0xFF0F1828);
  static const Color darkFieldColor = Color(0xFF152033);
  static const Color bodyTextColor = Color(0xFF1B2B48);
  static const Color weakSecondaryTextCOlor = Color(0xFFA4A4A4);
  static const Color disableColor = Color(0xFFADB5BD);
  static const Color dividerColor = Color(0xFFEDEDED);
  static const Color bgSecondColor = Color(0xFFF7F7FC);
  static const Color bgColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFD2D5F9);

  LinearGradient variantGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0XFFD2D5F9), Color(0XFF2C37E1)],);
  LinearGradient variantGradient2 = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0XFFEC9EFF), Color(0XFF5F2EEA)],);
 
  static ColorScheme get lightColorScheme => const ColorScheme.light(
      primary: AppColors.activeColorFont,
      secondary: AppColors.buttonColor,
      onBackground: AppColors.activeColorFont,
      onPrimary: AppColors.activeColorFont,
      onTertiary: AppColors.bgSecondColor,
      onSecondary: Color(0xFFADB5BD),
      onSurface: AppColors.disableColor,);

  static ColorScheme get darkColorScheme => const ColorScheme.dark(
        primary: AppColors.bgSecondColor,
        secondary: AppColors.darkButtonColor,
        onPrimary: AppColors.bgSecondColor,
        background: AppColors.activeColorFont,
        onBackground: AppColors.bgSecondColor,
        onSecondary: darkFieldColor,
        onSurface: AppColors.bgSecondColor,
        onTertiary: AppColors.darkFieldColor,
      );
}
