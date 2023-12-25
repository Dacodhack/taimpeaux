// HomePage.dart
import 'package:flutter/material.dart';
import 'package:taimpeaux/pages/Prez.dart';
import 'package:taimpeaux/pages/Chrono.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prez()),
                );
              },
              child: Text('Présentation de l\'application'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chrono()),
                );
              },
              child: Text('Chronomètre sur mesure'),
            ),
          ],
        ),
      ),
    );
  }
}