import 'package:equatable/equatable.dart';
import 'package:pokedex/components/pokemon_list/models/pokemon.dart';

abstract class PokemonListState extends Equatable {
  final List<Pokemon> pokemons;

  const PokemonListState(this.pokemons);

  @override
  List<Object> get props => [pokemons];
}

// Estado al iniciar la lista.
class PokemonListInit extends PokemonListState {
  const PokemonListInit(List<Pokemon> pokemons) : super(pokemons);
}

// Estado de éxito al cargar la lista.
class PokemonListSuccess extends PokemonListState {
  const PokemonListSuccess(List<Pokemon> pokemons) : super(pokemons);
}

// Estado de error al cargar la lista.
class PokemonListFailure extends PokemonListState {
  const PokemonListFailure(List<Pokemon> pokemons) : super(pokemons);
}

// Estado para cargar nuevos pokemon.
class PokemonListLoading extends PokemonListState {
  const PokemonListLoading(List<Pokemon> pokemons) : super(pokemons);
}
