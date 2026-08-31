import 'package:flutter/material.dart';

// Color personalizado
const Color _customColor = Color(0xFF5C11D4);

// Lista de colores para tema
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.blue,
  Colors.pink,
];

class AppTheme {
  // Controlar los indices del arreglo de colores

  final int selectedColor;

  // Constructor
  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor < _colorThemes.length,
        'Indice fuera del rango de colores',
      );

  //retorna algo de tipo ThemeData
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
