import 'package:flutter/material.dart';

class CustomLowerTextControlerSign extends StatelessWidget {
  String? firstText;
  String? secondText;
  late VoidCallback onTap;
  CustomLowerTextControlerSign({
    super.key,
    this.firstText,
    this.secondText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$firstText"),
        SizedBox(width: sizeWidth * 0.02),
        InkWell(
          onTap: onTap,
          child: Text(
            "$secondText",
            style: TextStyle(
              color: Color(0xff156778),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
