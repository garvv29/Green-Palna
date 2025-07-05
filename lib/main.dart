import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart'; // Uncomment for visual debugging

import 'package:gp1/screens/welcome_screen.dart'; // Import WelcomeScreen

void main() {
  // debugPaintSizeEnabled = true; // Uncomment for visual debugging
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stitch Design',
      theme: ThemeData(
        // IMPORTANT: Add these fonts to your pubspec.yaml and assets folder first!
        fontFamily: 'Manrope', // Primary font family
        // Define input decoration theme for consistent styling
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFEBF2E9), // bg-[#ebf2e9]
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // rounded-xl
            borderSide: BorderSide.none, // border-none
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // focus:border-none focus:outline-0 focus:ring-0
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          hintStyle: TextStyle(
            color: const Color(0xFF629155), // placeholder:text-[#629155]
            fontSize: 16, // text-base
            fontWeight: FontWeight.normal, // font-normal
          ),
          contentPadding: const EdgeInsets.all(16), // p-4
        ),
      ),
      home: const WelcomeScreen(), // Set WelcomeScreen as the initial screen
    );
  }
}