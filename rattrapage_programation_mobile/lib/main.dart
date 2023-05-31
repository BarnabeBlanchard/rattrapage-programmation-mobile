import 'package:flutter/material.dart';
import 'package:rattrapage_projet/screens/rechercher_ville.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Meteo',
      debugShowCheckedModeBanner: false,
      home: RechercherVille(),
    );
  }
}
