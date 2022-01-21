import 'package:flutter/material.dart';

class PokemonButton extends StatelessWidget {
  final Function() onPressed;
  const PokemonButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'Try again now',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(const Size(280, 44)),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
    );
  }
}
