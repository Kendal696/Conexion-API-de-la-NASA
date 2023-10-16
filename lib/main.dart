import 'package:flutter/material.dart';
import 'package:nasa_api_connection/home.dart';
import 'package:nasa_api_connection/simple_api_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblioteca',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ),
      home: SimpleApiScreen(),
    );
  }
}
