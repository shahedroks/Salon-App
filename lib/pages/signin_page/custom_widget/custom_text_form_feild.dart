import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  String? hintText;
  String? labelText;
  var controler;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool obscureText;
  final String? Function(String?)? validator;
  late VoidCallback? onPressed;
  // bool passwordVisible;
  // bool isVisibleIconShow;

  // final VoidCallback passIcon;
  // final VoidCallback valitation;

  CustomTextFormFeild({
    super.key,
    this.hintText,
    this.labelText,
    this.controler,
    this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    required this.onPressed,

    // required this.valitation,
    // required this.isVisibleIconShow,
    // required this.passIcon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      // height: sizeHeight * 0.06,
      width: sizeWidth,
      margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
      child: TextFormField(
        // validator: ,
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        controller: controler,
        validator: validator,
        decoration: InputDecoration(
          filled: true,

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon:
              suffixIcon != null
                  ? IconButton(onPressed: onPressed!, icon: Icon(suffixIcon))
                  : null,

          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          //   borderSide: BorderSide(color: Colors.grey.shade400),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          //   borderSide: BorderSide(color: Colors.grey.shade400),
          // ),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
