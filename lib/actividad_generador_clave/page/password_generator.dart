import 'package:flutter/material.dart';
import 'package:layout_builder/actividad_generador_clave/widgets/password_view.dart';

import '../widgets/form_options.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  late double width;
  late String currentPassword;
  Map<String, dynamic> passwordOptions = {
    "length": 8,
    "uppercase": true,
    "lowercase": true,
    "numbers": true,
    "symbols": false
  };

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

  _updateOptions(Map<String, dynamic> newOptions) {
    setState(() {
      passwordOptions = newOptions;
      _generatePassword();
    });
  }

  _generatePassword() {
    return "aBcD1234";
  }
}
