import 'package:daily_weather/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData get theme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: kPrimaryColor,
        brightness: Brightness.light,
        primary: kPrimaryColor,
        onPrimary: kOnPrimaryColor,
        secondary: kSecondaryColor,
        onSecondary: kOnSecondaryColor,
        error: kErrorColor,
        onError: kOnErrorColor,
        background: kBackgroundColor,
        onBackground: kOnBackgroundColor,
        surface: kSurfaceColor,
        onSurface: kOnSurfaceColor,
      ),
      useMaterial3: true,
    );
