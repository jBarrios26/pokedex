import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/components/pokemon_list/models/pokemon.dart';
import 'package:pokedex/components/pokemon_list/models/pokemon_list.dart';

class PokemonProvider {
  final String pokeApiURL = 'https://pokeapi.co/api/v2';
  final int successCode = 200;

  Future<List<Pokemon>> fetchPokemonList(int offset) async {
    final response = await http.get(
      Uri.parse('$pokeApiURL/pokemon?limit=7&offset=$offset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != successCode) {
      throw Exception('Error while loading new pokemons.');
    }

    PokemonList results = PokemonList.fromJson(jsonDecode(response.body));

    return _fetchPokemons(results);
  }

  Future<List<Pokemon>> _fetchPokemons(PokemonList results) async {
    List<Pokemon> pokemons = [];

    for (var pokemon in results.pokemons) {
      final pokemonRequest = await http.get(
        Uri.parse(pokemon.url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (pokemonRequest.statusCode != successCode) {
        throw Exception('Error while loading a new pokemon: ${pokemon.name}');
      }
      pokemons.add(Pokemon.fromJson(jsonDecode(pokemonRequest.body)));
    }
    return pokemons;
  }
}
