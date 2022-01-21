import 'package:flutter/material.dart';

import '../../../theme.dart';

class PokemonInfo extends StatelessWidget {
  final String pokemonPhoto;
  final String pokemonName;
  const PokemonInfo({
    Key? key,
    required this.pokemonPhoto,
    required this.pokemonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            FadeInImage.assetNetwork(
              placeholder: "assets/images/pikachu_lost.png",
              image: pokemonPhoto,
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              pokemonName,
              style: TextStyle(
                  color: PokemonColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )
          ],
        ));
  }
}
