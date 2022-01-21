import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_event.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_events.dart';
import 'package:pokedex/components/pokemon_list/data/pokemon_repository.dart';
import 'package:pokedex/components/pokemon_list/view/pokemonlist.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => PokemonRepository(),
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) =>
                PokemonListBloc(context.read<PokemonRepository>())
                  ..add(PokemonFetched()),
          ),
          BlocProvider(
            create: (context) => NetworkBloc()..add(NetworkListened()),
          )
        ], child: const PokemonsList()),
      ),
    );
  }
}
