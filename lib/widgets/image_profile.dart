import 'package:flutter/material.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
