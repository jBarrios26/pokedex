import 'package:flutter/material.dart';

class PikachuLoading extends StatelessWidget {
  const PikachuLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading.gif',
            height: 70,
            width: 100,
          ),
          const Text(
            'Loading...',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
