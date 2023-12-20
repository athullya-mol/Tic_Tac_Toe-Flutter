import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: const Color.fromARGB(255, 66, 66, 66),
    secondary: Colors.blue.shade900,
    onBackground: Colors.black87,
    onPrimary: Colors.white,
  )
);