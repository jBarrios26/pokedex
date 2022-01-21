import 'package:flutter/material.dart';

class PokemonColors {
  static Color red = const Color(0xFFD94256);
  static Color white = const Color(0xFFFFFFFF);
}

class PokemonTheme {
  static get pokemonTheme {
    return ThemeData(primaryColor: PokemonColors.red, fontFamily: 'Helvetica');
  }
}
