import 'package:pokedex/components/pokemon_list/data/pokemon_provider.dart';
import 'package:pokedex/components/pokemon_list/models/pokemon.dart';

class PokemonRepository {
  final PokemonProvider _pokemonProvider = PokemonProvider();

  Future<List<Pokemon>> fetchPokemonList(int offset) =>
      _pokemonProvider.fetchPokemonList(offset);
}
