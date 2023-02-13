import 'package:flutter/material.dart';
import 'package:starter_temp/core/utils/color_manager.dart';
import '../../core/utils/font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    fontFamily: FontConstants.cairoFontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
  );
}
