import 'package:flutter/material.dart';
import 'package:pokedex/components/error_page/widgets/pokemon_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ErrorView(),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
            left: 31,
            top: 190,
            child: Text(
              'Something went wrong',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            )),
        const Positioned(
            left: 31,
            top: 230,
            child: Text(
              'please try again later',
              style: TextStyle(fontSize: 16),
            )),
        Positioned(
            top: 300,
            child: PokemonButton(onPressed: () {
              Navigator.of(context).pop();
            })),
        Positioned(
          bottom: -10,
          child: Image.asset(
            'assets/images/pikachu_lost.png',
            alignment: const Alignment(0, -1.6),
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
