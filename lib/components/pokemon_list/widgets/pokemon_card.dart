import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'pokemon_info.dart';

class PokemonCard extends StatelessWidget {
  final String pokemonPhoto;
  final String pokemonName;
  final int pokemonID;

  const PokemonCard(
      {Key? key,
      required this.pokemonID,
      required this.pokemonName,
      required this.pokemonPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.center,
            children: [
              Positioned(
                  left: -30,
                  top: -30,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: SvgPicture.asset(
                      'assets/images/pokebalsvg.svg',
                      color: const Color(0x44FFFFFF),
                      width: 150,
                      height: 155,
                    ),
                  )),
              Positioned(
                right: 10,
                top: 31,
                child: Text(
                  "#${pokemonID.toString().padLeft(3, '0')}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      color: Color(0x44FFFFFF)),
                ),
              ),
              PokemonInfo(pokemonPhoto: pokemonPhoto, pokemonName: pokemonName)
            ],
          )),
    );
  }
}
