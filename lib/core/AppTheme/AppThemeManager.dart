import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppColors.dart';

class AppThemeManager {
  static final ThemeData lightheme = ThemeData(
    fontFamilyFallback: const ["Cairo", "Poppins"],
    fontFamily: "Poppins",

    scaffoldBackgroundColor: AppColors.lighgrey,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lighgrey,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      ),
    ),
  );

  static final ThemeData darktheme = ThemeData(
    fontFamily: "Poppins",

    fontFamilyFallback: const ["Cairo", "Poppins"],

    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.black,
    canvasColor: AppColors.black,

    colorScheme: ColorScheme.dark(
      surface: AppColors.black,
      surfaceContainer: AppColors.black,
    ),

    cardColor: AppColors.black,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      ),
    ),
  );
}
