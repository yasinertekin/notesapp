import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';

extension MyColorExtension on MyColor {
  Color get color {
    switch (this) {
      case MyColor.nero:
        return const Color.fromRGBO(37, 37, 37, 1);
      case MyColor.white:
        return const Color.fromARGB(255, 255, 255, 255);
      case MyColor.red:
        return const Color.fromARGB(255, 255, 0, 0);
      case MyColor.pinkalicious:
        return const Color.fromRGBO(253, 153, 255, 1);
      case MyColor.rubberRadish:
        return const Color.fromRGBO(255, 158, 158, 1);
      case MyColor.ulvaLactucaGreen:
        return const Color.fromRGBO(145, 244, 143, 1);
      case MyColor.goldilocks:
        return const Color.fromRGBO(255, 245, 153, 1);
      case MyColor.glitchyShaderBlue:
        return const Color.fromRGBO(158, 255, 255, 1);
      case MyColor.shyMoment:
        return const Color.fromRGBO(182, 156, 255, 1);
      case MyColor.turtleWarrior:
        return const Color.fromRGBO(48, 190, 113, 1);
      case MyColor.americanSilver:
        return const Color.fromRGBO(207, 207, 207, 1);
      case MyColor.kettleman:
        return const Color.fromRGBO(96, 96, 96, 1);
      case MyColor.blackLiquorice:
        return const Color.fromRGBO(59, 59, 59, 1);
      case MyColor.hydrargyrum:
        return const Color.fromRGBO(154, 154, 154, 1);
    }
  }
}
