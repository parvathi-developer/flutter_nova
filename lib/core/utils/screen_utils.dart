import 'package:flutter/material.dart';

class ScreenUtils {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleFactor;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    // Base design width(Mobile first)
    scaleFactor = screenWidth / 375;
  }

  static double scale(double size) {
    return size * scaleFactor.clamp(0.85, 1.2);
  }
}
