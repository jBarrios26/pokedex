import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_list/view/pokemon_list_page.dart';
import 'package:pokedex/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex',
        theme: PokemonTheme.pokemonTheme,
        home: const PokemonListPage(),
        debugShowCheckedModeBanner: false);
  }
}
