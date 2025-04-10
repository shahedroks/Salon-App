import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
   Widget child;
  OnBoardingImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      width: sizeHeight,
      height: sizeHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/OnBoarding1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
