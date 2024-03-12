import 'package:flutter/material.dart';

Widget useLayoutBuilder() {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      return Container(
        width: width,
        height: height,
        color: Colors.amber,
        child: Center(
          child: Container(
            width: width * 0.5,
            height: height * 0.5,
            color: Colors.blueGrey,
            child: Center(
              child: Text('Hola: ancho: $width x altura: $height'),
            ),
          ),
        ),
      );
    },
  );
}
