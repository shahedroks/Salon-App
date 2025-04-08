import 'package:flutter/material.dart';

class CustomSigninButton extends StatelessWidget {
  String? text;
  Color? contenerColor;
  Color? textColor;
  String? image;
  bool showAvater;
  final VoidCallback? signIn;
  CustomSigninButton({
    super.key,
    this.text,
    this.contenerColor,
    this.textColor,
    this.image,
    this.showAvater = true,
    this.signIn,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: signIn,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
        height: sizeHeight * 0.06,
        width: sizeWidth,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xff156778)),
          color: contenerColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showAvater)
              CircleAvatar(child: Image.asset("$image"), radius: 10),
            SizedBox(width: showAvater ? sizeWidth * 0.03 : 0),
            Text(text!, style: TextStyle(fontSize: 18, color: textColor)),
          ],
        ),
      ),
    );
  }
}
