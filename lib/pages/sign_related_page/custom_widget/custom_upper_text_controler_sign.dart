import 'package:flutter/material.dart';

class CustomUpperTextControlerSign extends StatelessWidget {
  String? firstText;
  String? secondText;
  CustomUpperTextControlerSign({super.key, this.firstText, this.secondText});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$firstText",
          style: TextStyle(
            fontSize: sizeWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("$secondText"),
      ],
    );
  }
}
