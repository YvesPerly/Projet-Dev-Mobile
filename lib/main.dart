import 'package:flutter/material.dart';
import 'ecrans/liste_taches.dart';
import 'ecrans/ajouter_tache.dart';
import 'ecrans/modifier_tache.dart';

void main() {
  runApp(MonApp());
}

class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des tâches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333)),
          headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333)),
          headline3: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333)),
          headline4: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF333333)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => EcranListeTaches(),
        '/ajout': (context) => EcranAjoutTache(),
        '/modification': (context) => EcranModificationTache(),
      },
    );
  }
}
