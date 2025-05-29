// Couleurs du thème
import 'package:flutter/material.dart';

class KColors {
  static const Color primary = Color(0xFF07294D); // Bleu foncé
  static const Color secondary = Color(0xFF1B4F08); // Vert foncé
  static const Color tertiary = Color(0xFFDB8C25); // Orange clair
  static const Color purple = Color(0xFF7A68A6); // Violet
  static const Color beige = Color(0xFFF7EAD0); // Beige clair
}

// Thème de l'application
ThemeData appTheme(BuildContext context) {
  return ThemeData(
    primaryColor: KColors.primary,
    colorScheme: ColorScheme.light(
      primary: KColors.primary,
      secondary: KColors.secondary,
      tertiary: KColors.tertiary,
    ),
    textTheme: TextTheme(
      headlineLarge: KTypography.h1(context),
      headlineMedium: KTypography.h2(context),
      headlineSmall: KTypography.h3(context),
      bodyLarge: KTypography.h4(context),
      bodyMedium: KTypography.h5(context),
    ),
    // Ajoutez d'autres propriétés de thème ici
  );
}

class KTypography {
  static TextStyle h1(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h2(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h3(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h4(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold, color: color);
  }

  static TextStyle h5(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.normal, color: color);
  }

  static TextStyle h6(BuildContext context, {Color? color}) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.normal, color: color);
  }
}
