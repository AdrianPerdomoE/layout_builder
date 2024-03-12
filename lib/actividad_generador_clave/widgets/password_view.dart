import 'package:flutter/material.dart';

class PasswordView extends StatelessWidget {
  late double width;
  String currentPassword;
  final Function onRefresh;
  PasswordView(
      {super.key, required this.currentPassword, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return _passwordView();
  }

  Widget _passwordView() {
    return Container(
      width: width * 0.8,
      height: 80,
      padding: const EdgeInsets.all(10),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentPassword,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left),
            _buttonGroup()
          ]),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: [
        const IconButton(onPressed: null, icon: Icon(Icons.copy)),
        IconButton(
            icon: const Icon(Icons.refresh), onPressed: () => onRefresh())
      ],
    );
  }
}
