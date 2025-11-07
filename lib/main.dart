import 'package:flutter/material.dart';
import 'screens/test_screen.dart';

void main() {
  runApp(const VocationalTestApp());
}

class VocationalTestApp extends StatelessWidget {
  const VocationalTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Vocacional UT San Juan',
      theme: ThemeData(
        primaryColor: const Color(0xFF002B5C),
        scaffoldBackgroundColor: const Color(0xFF002B5C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002B5C),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00A859),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: const VocationalTestScreen(),
    );
  }
}
