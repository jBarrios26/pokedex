import 'package:bloc/bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_events.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_state.dart';
import 'package:pokedex/components/pokemon_list/data/pokemon_repository.dart';
import 'package:pokedex/components/pokemon_list/models/pokemon.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 500);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonRepository repository;

  PokemonListBloc(this.repository) : super(const PokemonListInit([])) {
    on<PokemonFetched>(_fetchMorePokemon,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _fetchMorePokemon(
      PokemonFetched event, Emitter<PokemonListState> emit) async {
    try {
      emit(PokemonListLoading(state.pokemons));
      List<Pokemon> pokemonList =
          await repository.fetchPokemonList(state.pokemons.length);
      List<Pokemon> pokemons = (state.pokemons + pokemonList);
      return emit(PokemonListSuccess(pokemons));
    } catch (e) {
      return emit(PokemonListFailure(state.pokemons));
    }
  }
}
