import 'package:flutter/material.dart';

class BoardingUpperText extends StatelessWidget {
  String text1;
  String text2;
  BoardingUpperText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          Text(
            "$text1",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text("$text2", style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
