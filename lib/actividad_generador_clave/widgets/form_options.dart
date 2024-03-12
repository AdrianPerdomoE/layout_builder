import 'package:flutter/material.dart';

import '../models/password_options.dart';

class FormOptions extends StatefulWidget {
  final PasswordOptions passwordOptions;
  Function(PasswordOptions) onOptionsChanged;
  FormOptions(
      {super.key,
      required this.passwordOptions,
      required this.onOptionsChanged});

  @override
  State<FormOptions> createState() => _FormOptionsState();
}

class _FormOptionsState extends State<FormOptions> {
  late double width;
  late int length;
  late TextEditingController _lengthController;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    length = widget.passwordOptions.length;
    _lengthController = TextEditingController(text: length.toString());
    return _formOptions();
  }

  Widget _formOptions() {
    return Container(
      width: width * 0.8,
      height: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_formTitle(), _formLengthOption()],
      ),
    );
  }

  Widget _formTitle() {
    return Container(
      width: width * 0.8,
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [
          Text(
            "Personalice su contraseña",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.blueGrey,
            thickness: 4,
          ),
        ],
      ),
    );
  }

  Widget _formLengthOption() {
    return Row(children: [
      SizedBox(
        width: width * 0.1,
        child: _lengthInput(),
      ),
      SizedBox(width: width * 0.5, child: _slider())
    ]);
  }

  Widget _lengthInput() {
    return TextFormField(
      controller: _lengthController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onTapOutside: (event) {
        if (_lengthController.text.isEmpty) return;

        setState(() {
          if (int.parse(_lengthController.text) < 1)
            _lengthController.text = "1";
          if (int.parse(_lengthController.text) > 51)
            _lengthController.text = "51";
          // default value (8 characters
          length = int.parse(_lengthController.text);
          widget.passwordOptions.length = length;
          widget.onOptionsChanged(widget.passwordOptions);
        });
      },
    );
  }

  _slider() {
    return Slider(
      min: 1,
      max: 51,
      value: length.toDouble(),
      activeColor: Colors.red.shade800,
      onChanged: (value) {
        setState(() {
          length = value.toInt();
          widget.passwordOptions.length = length;
          _lengthController.text = length.toString();
          widget.onOptionsChanged(widget.passwordOptions);
        });
      },
    );
  }
}
