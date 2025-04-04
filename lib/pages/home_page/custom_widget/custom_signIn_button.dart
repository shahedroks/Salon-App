import 'package:flutter/material.dart';

class CustomSigninButton extends StatelessWidget {
  String? text;
  CustomSigninButton({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
      height: sizeHeight * 0.06,
      width: sizeWidth,
      decoration: BoxDecoration(
        color: Color(0xff156778),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(text!, style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
