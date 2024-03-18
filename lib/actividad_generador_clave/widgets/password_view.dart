import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordView extends StatelessWidget {
  late double width;
  String currentPassword;
  final Function onRefresh;
  PasswordView(
      {super.key, required this.currentPassword, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return _passwordView(context);
  }

  Widget _passwordView(BuildContext context) {
    return Container(
      width: width * 0.8,
      height: 80,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
            bottom: BorderSide(color: Colors.blueGrey.shade500, width: 10)),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(5)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(currentPassword,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  textAlign: TextAlign.left),
            ),
            _buttonGroup(context)
          ]),
    );
  }

  Widget _buttonGroup(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => clip(context), icon: const Icon(Icons.copy)),
        IconButton(
            icon: const Icon(Icons.refresh), onPressed: () => onRefresh())
      ],
    );
  }

  void clip(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: currentPassword))
        .then((result) {
      final snackBar = SnackBar(
        content: const Center(child: Text('Copiado')),
        action: SnackBarAction(label: 'Ok', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
