import 'package:flutter/material.dart';
import 'package:selon/network_group/Auth_controler.dart';

class CustomSignControlerButton extends StatelessWidget {
  String? text;
  Color? contenerColor;
  Color? textColor;
  String? image;
  IconData? icon;
  bool showAvater;
  final VoidCallback onTap;
  CustomSignControlerButton({
    super.key,
    this.text,
    this.contenerColor,
    this.textColor,
    this.image,
    this.icon,
    this.showAvater = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return AuthControler.isCerculer == true
        ? Center(child: CircularProgressIndicator(color: Colors.blue))
        : InkWell(
          onTap: onTap,
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
                  image != null
                      ? CircleAvatar(child: Image.asset("$image"), radius: 10)
                      : Icon(icon),
                SizedBox(width: showAvater ? sizeWidth * 0.03 : 0),
                Text(text!, style: TextStyle(fontSize: 18, color: textColor)),
              ],
            ),
          ),
        );
  }
}
