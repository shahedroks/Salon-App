import 'package:flutter/material.dart';

class ForgetText extends StatelessWidget {
  String? text;
  VoidCallback? onTap;
  ForgetText({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: sizeHeight * 0.01),
        margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
        alignment: Alignment.topRight,
        child: Text("$text", style: const TextStyle(color: Color(0xff156778))),
      ),
    );
  }
}
