
import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const SavoreApp());
}

class SavoreApp extends StatelessWidget {
  const SavoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAVORE',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5EFE6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF795548),
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigation(),
    );
  }
}
