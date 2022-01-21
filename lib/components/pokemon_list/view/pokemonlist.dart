import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/error_page/view/error_page.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/network_state.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_events.dart';
import 'package:pokedex/components/pokemon_list/bloc/pokemon_list_state.dart';
import 'package:pokedex/components/pokemon_list/widgets/pikachu_loading.dart';
import 'package:pokedex/components/pokemon_list/widgets/pokemon_card.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({Key? key}) : super(key: key);

  @override
  _PokemonsListState createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) async {
        if (state is NetworkConnectionFailure) {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const ErrorPage()));

          context.read<PokemonListBloc>().add(PokemonFetched());
        }
      },
      child: BlocConsumer<PokemonListBloc, PokemonListState>(
          builder: (context, state) {
        if (state is PokemonListInit) {
          return const PikachuLoading();
        }
        return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: state.pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                if (state is PokemonListLoading &&
                    index == state.pokemons.length - 1) {
                  return const PikachuLoading();
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  child: PokemonCard(
                      pokemonID: state.pokemons[index].pokedexNumber,
                      pokemonName: state.pokemons[index].pokemonName,
                      pokemonPhoto: state.pokemons[index].pokemonPhotoURL),
                );
              }),
        );
      }, listener: (context, state) async {
        if (state is PokemonListFailure) {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const ErrorPage()));
          context.read<PokemonListBloc>().add(PokemonFetched());
        }
      }),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      context.read<PokemonListBloc>().add(PokemonFetched());
    }
    return false;
  }
}
