import 'package:flutter/material.dart';
import 'package:nasa_api_connection/simple_api_nasa_screen.dart';

class SimpleApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca de la NASA'),
      ),
      body: Center(
        child: ElevatedButton(
  child: Text('Conectar con la API'),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SimpleApiNasaScreen()),
    );
  },
),
      ),
    );
  }
}
