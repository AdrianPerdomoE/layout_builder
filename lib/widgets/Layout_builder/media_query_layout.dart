import 'package:flutter/material.dart';

class MediaQueryWidget extends StatelessWidget {
  late double width;
  late double height;
  MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container();
  }
}
