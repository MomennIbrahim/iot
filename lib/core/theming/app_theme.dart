// import 'package:flutter/material.dart';
// import 'package:iot_test_app/core/config/app_palette.dart';
// import 'package:iot_test_app/core/theming/text_styles_manager.dart';
// import 'package:kera/core/theming/app_palette.dart';
// import 'package:kera/core/theming/text_styles_manager.dart';

// class AppTheme {
//   static ThemeData light = ThemeData.light().copyWith(
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppPalette.primaryColor[500],
//       unselectedItemColor: AppPalette.greyColor[500],
//       backgroundColor: Colors.white,
//       showUnselectedLabels: true,
//       elevation: 0,
//     ),
//     splashColor: Colors.transparent,
//     highlightColor: Colors.transparent,
//     textSelectionTheme: TextSelectionThemeData(
//       selectionHandleColor: AppPalette.primaryColor[500],
//       selectionColor: AppPalette.primaryColor[100],
//     ),
//     primaryColorLight: AppPalette.primaryColor[500],
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppPalette.primaryColor[500]!,
//       primary: AppPalette.primaryColor[500],
//       brightness: Brightness.light,
//     ),
//     datePickerTheme: DatePickerThemeData(
//       dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return AppPalette.primaryColor[500];
//         }
//         return AppPalette.foregroundLight;
//       }),
//       todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return AppPalette.primaryColor[500];
//         }
//         return AppPalette.foregroundLight;
//       }),

//       todayForegroundColor: WidgetStateProperty.resolveWith((states) {
//         if (states.contains(WidgetState.selected)) {
//           return AppPalette.foregroundLight;
//         }
//         return AppPalette.primaryColor[500];
//       }),
//       backgroundColor: AppPalette.foregroundLight,
//       surfaceTintColor: AppPalette.foregroundLight,
//       headerBackgroundColor: AppPalette.primaryColor[500],
//       headerForegroundColor: Colors.white,
//       dayStyle: const TextStyle(color: Colors.black),
//       yearStyle: const TextStyle(color: Colors.black),
//       todayBorder: BorderSide(color: AppPalette.primaryColor[500]!),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       cancelButtonStyle: TextButton.styleFrom(
//         foregroundColor: AppPalette.primaryColor[500],
//       ),
//       confirmButtonStyle: TextButton.styleFrom(
//         foregroundColor: AppPalette.primaryColor[500],
//       ),
//     ),
//     listTileTheme: const ListTileThemeData(tileColor: AppPalette.tileLight),
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppPalette.scaffoldBackgroundColorLight,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.transparent,
//       surfaceTintColor: Colors.transparent,
//       titleTextStyle: TextStylesManager.titleMediumLight,
//     ),
//     primaryColor: AppPalette.primaryColor[500],
//     textTheme: TextTheme(
//       titleLarge: TextStylesManager.titleLargeLight,
//       titleMedium: TextStylesManager.titleMediumLight,
//       headlineLarge: TextStylesManager.headLineLargeLight,
//       headlineMedium: TextStylesManager.headLineMediumLight,
//       headlineSmall: TextStylesManager.headLineSmallLight,
//       bodyLarge: TextStylesManager.bodyLargeLight,
//       bodyMedium: TextStylesManager.bodyMediumLight,
//       bodySmall: TextStylesManager.bodySmallLight,
//     ),
//   );

//   static ThemeData dark = ThemeData.dark().copyWith(
//     listTileTheme: const ListTileThemeData(tileColor: AppPalette.tileDark),

//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: AppPalette.scaffoldBackgroundColorDark,
//     primaryColor: AppPalette.primaryColor,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.transparent,
//       surfaceTintColor: Colors.transparent,
//       titleTextStyle: TextStylesManager.titleMediumDark,
//     ),
//     textTheme: TextTheme(
//       titleLarge: TextStylesManager.titleLargeDark,
//       titleMedium: TextStylesManager.titleMediumDark,
//       headlineLarge: TextStylesManager.headLineLargeDark,
//       headlineMedium: TextStylesManager.headLineMediumDark,
//       headlineSmall: TextStylesManager.headLineSmallDark,
//       bodyLarge: TextStylesManager.bodyLargeLight,
//       bodyMedium: TextStylesManager.bodyMediumDark,
//       bodySmall: TextStylesManager.bodySmallDark,
//     ),
//   );
// }
