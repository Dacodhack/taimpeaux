// Prez.dart
import 'package:flutter/material.dart';
import 'package:taimpeaux/pages/HomePage.dart';
import 'package:taimpeaux/pages/Prez.dart';
import 'package:taimpeaux/pages/Chrono.dart';

class Prez extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Présentation de l\'application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue sur mon application',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Voici une petite application pour avoir différents minuteurs qui se suivent. L\'application est écrite en Dart et a été conçue à l\'aide des suggestions de ChatGPT.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '🇬🇧',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Here\'s a small application to have different timers that follow each other. The application is written in Dart and was designed with the chat prompts from ChatGPT.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '🇪🇸',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Aquí tienes una pequeña aplicación para tener diferentes temporizadores que se suceden. La aplicación está escrita en Dart y fue diseñada con las sugerencias de chat de ChatGPT.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
