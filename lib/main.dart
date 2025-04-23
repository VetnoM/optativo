import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pt1_Cognom_Nom',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Puedes cambiar el color aquí
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      

      ),
      home: const HomeScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
}
