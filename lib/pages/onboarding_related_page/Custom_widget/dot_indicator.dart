import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;

  const DotIndicator({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.01),
          height: sizeHeight * 0.014,
          width: currentIndex == index ? 35 : 10,

          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
