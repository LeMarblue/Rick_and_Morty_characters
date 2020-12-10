import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/presentation/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final _whiteTextStyle = TextStyle(color: AppColors.primaryText);
  static final _greyTextStyle = TextStyle(color: AppColors.secondaryText);
  static final _greenTextStyle = TextStyle(color: AppColors.primary);

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: TextTheme(
      headline4: _whiteTextStyle, // titulo de detalles
      subtitle2: _greyTextStyle,
      bodyText1: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: _greenTextStyle,
    ),
  );
}
