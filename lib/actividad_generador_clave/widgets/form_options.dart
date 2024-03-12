import 'package:flutter/material.dart';

class FormOptions extends StatefulWidget {
  final Map<String, dynamic> passwordOptions;
  Function(Map<String, dynamic>) onOptionsChanged;
  late TextEditingController _lengthController ;
  FormOptions(
      {super.key,
      required this.passwordOptions,
      required this.onOptionsChanged}){
        int length = passwordOptions['length'];
        _lengthController = TextEditingController(text: length.toString());
      }

  @override
  State<FormOptions> createState() => _FormOptionsState();
}

class _FormOptionsState extends State<FormOptions> {
  late double width;
  late int length;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    length = widget.passwordOptions["length"];
    
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
      controller:,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onTapOutside: (event) {
        String = 
        (value) {
          if (value.isEmpty) return;
          if (int.parse(value) < 1) value = "1";
          if (int.parse(value) > 51) value = "51";
          setState(() {
            // default value (8 characters
            length = int.parse(value);
            widget.passwordOptions["length"] = length;
            widget.onOptionsChanged(widget.passwordOptions);
          });
        };
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
          widget.passwordOptions["length"] = length;
          widget.onOptionsChanged(widget.passwordOptions);
        });
      },
    );
  }
}
