import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get primaryColor;

  Color get lightBlueColor;

  Color get blackColor;
}

class DarkColors extends LightColors {
  const DarkColors();

  @override
  Color get primaryBg => const Color(0x001c1b1b);

  @override
  Color get primaryColor => const Color(0xFF1c1b1b);

  @override
  Color get lightBlueColor => const Color(0xFF3CC8BF);

  @override
  Color get blackColor => const Color(0xFF000000);
}

class LightColors implements AppColors {
  const LightColors();

  @override
  // RGBO(236, 239, 241, 1)
  Color get primaryBg => const Color(0xFFeceff1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get primaryColor => const Color(0xFF1C1B1B);

  @override
  Color get lightBlueColor => const Color(0xFF3CC8BF);

  @override
  Color get blackColor => const Color(0xFF000000);
}
