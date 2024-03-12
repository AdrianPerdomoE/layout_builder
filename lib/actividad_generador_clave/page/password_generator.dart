import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout_builder/actividad_generador_clave/widgets/password_view.dart';

import '../models/password_options.dart';
import '../widgets/form_options.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  late double width;
  late String currentPassword;
  PasswordOptions passwordOptions = PasswordOptions(
    length: 8,
    uppercase: true,
    lowercase: true,
    numbers: true,
    symbols: true,
  );

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    setState(() {
      currentPassword = _generatePassword();
    });
    return Container(
      width: width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        PasswordView(
            currentPassword: currentPassword,
            onRefresh: () {
              setState(() {
                currentPassword = _generatePassword();
              });
            }),
        const SizedBox(height: 20),
        FormOptions(
            passwordOptions: passwordOptions, onOptionsChanged: _updateOptions),
      ]),
    );
  }

  _updateOptions(PasswordOptions newOptions) {
    setState(() {
      if (!newOptions.uppercase &&
          !newOptions.lowercase &&
          !newOptions.numbers &&
          !newOptions.symbols) {
        newOptions.uppercase = true;
      }

      _generatePassword();
    });
  }

  _generatePassword() {
    String password = '';
    String characters = '';
    if (passwordOptions.uppercase) {
      characters += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (passwordOptions.lowercase) {
      characters += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (passwordOptions.numbers) {
      characters += '0123456789';
    }
    if (passwordOptions.symbols) {
      characters += '!@#%^&*()_+';
    }

    for (int i = 0; i < passwordOptions.length; i++) {
      password += characters[Random().nextInt(characters.length)];
    }
    return password;
  }
}
