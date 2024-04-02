import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashThree extends StatelessWidget {
  const SplashThree({super.key});

  @override
  Widget build(BuildContext context) {
   return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/Animation - 1711429009911.json',
            height: 300,
            width: 300,
          ),
          SizedBox(height: 20),
          Text(
            "To the future fast...",
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}