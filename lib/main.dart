import 'package:flutter/material.dart';
import 'package:layout_builder/actividad_generador_clave/page/password_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          title: const Text(
            'Generador de claves',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: const Center(
          child: PasswordGenerator(),
        ),
      ),
    );
  }
}
