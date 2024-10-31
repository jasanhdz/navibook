import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 1})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length - 1,
            'Selected color must be less or equal than 0 ${colorList.length - 1}');

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor]);
}
