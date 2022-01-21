import 'package:equatable/equatable.dart';

abstract class PokemonListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Evento cuando el usuario pide que se carguen más pokemon.
class PokemonFetched extends PokemonListEvent {}
