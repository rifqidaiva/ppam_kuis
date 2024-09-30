import 'package:flutter/material.dart';
import 'package:ppam_kuis/pages/page_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kuis PPAM",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purpleAccent,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purpleAccent,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home: const PageRegister(),
    );
  }
}
