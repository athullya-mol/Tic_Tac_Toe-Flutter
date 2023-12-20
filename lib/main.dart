import 'package:flutter/material.dart';
import 'package:tictactoe/screens/splash_screen.dart';
import 'package:tictactoe/theme/dark_theme.dart';
import 'package:tictactoe/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}
