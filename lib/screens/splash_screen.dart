// ignore_for_file: unused_import

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/theme/dark_theme.dart';
import 'package:tictactoe/theme/light_theme.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const GameScreen(),));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: content()
    );
  }
  Widget content(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('assets/animations/tictactoe_splash.json'),
            ),
            AnimatedTextKit(
              animatedTexts:[ 
                FadeAnimatedText('Tic',
                textStyle: const TextStyle(
                color: Colors.red,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
              ),
              FadeAnimatedText('Tac',
                textStyle: TextStyle(
                color: Colors.blueAccent.shade700,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
              ),
              FadeAnimatedText('Toe',
                textStyle: const TextStyle(
                color: Colors.red,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
              ),
          ]),
          ],
        ),
);
}
}
