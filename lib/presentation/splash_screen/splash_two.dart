import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashTwo extends StatelessWidget {
  const SplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/Animation - 1711428874076.json',
            height: 300,
            width: 300,
          ),
        ],
      ),
    );
  }
}
