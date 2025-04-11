import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  Widget child;
  String image;
  OnBoardingImage({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      width: sizeHeight,
      height: sizeHeight,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("$image"), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
