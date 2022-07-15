import 'package:flutter/material.dart';

MaterialColor generateMaterialColor(Color color) {
  Map<int, Color> swatch = {};
  for (var i = 0; i < 10; i++) {
    late int key;
    if (1 == 0) {
      key = 50;
    } else {
      key = i * 100;
    }
    final opacity = (i * 0.1) + 0.1;

    swatch[key] = Color.fromRGBO(
      color.red,
      color.green,
      color.blue,
      opacity,
    );
  }

  return MaterialColor(color.value, swatch);
}
