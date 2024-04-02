import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/Animation - 1711428893541.json',
            height: 300,
            width: 300,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}