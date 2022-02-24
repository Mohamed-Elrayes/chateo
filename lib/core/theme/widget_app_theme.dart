part of 'app_theme.dart';

class WidgetAppTheme {
  static late ColorScheme _colorScheme;
  static void setterColorScheme(ColorScheme colorScheme) =>
      _colorScheme = colorScheme;

  static InputDecorationTheme get inputDecoration => InputDecorationTheme(
        hintStyle: TextAppTheme.textTheme.bodyText2
            ?.copyWith(color: _colorScheme.onSurface),
        focusedBorder: const UnderlineInputBorder(),
      );

  static IconThemeData get iconThemeData =>
      IconThemeData(color: _colorScheme.onPrimary);

  static AppBarTheme get appBarTheme => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              _colorScheme.primary != AppColors.activeColorFont
                  ? Brightness.light
                  : Brightness.dark,
        ),
        // toolbarHeight: 50,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: _colorScheme.primary),
      );

  static BottomNavigationBarThemeData get bottomNavBar =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: _colorScheme.onPrimary,
        unselectedItemColor: _colorScheme.secondaryContainer,
      );

  static TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: _colorScheme.secondary,
        labelPadding: const EdgeInsets.symmetric(horizontal: 3),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: _colorScheme.primary,
        ),
        unselectedLabelColor: _colorScheme.secondaryContainer,
      );

  static ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: _colorScheme.secondary,
          onPrimary: _colorScheme.onBackground,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
}
