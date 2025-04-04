import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  String? hintText;
  String? labelText;
  var controler;
  IconData prefixIcon;
  IconData suffixIcon;
  final String? Function(String?)? validator;
  // bool passwordVisible;
  // bool isVisibleIconShow;
  // bool isObscureText;
  // final VoidCallback passIcon;
  // final VoidCallback valitation;

  CustomTextFormFeild({
    super.key,
    this.hintText,
    this.labelText,
    this.controler,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.validator,

    // required this.valitation,
    // required this.isVisibleIconShow,
    // required this.passIcon,
    // required this.isObscureText
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Container(
      height: sizeHeight * 0.06,
      width: sizeWidth,
      margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
      child: TextFormField(
        // validator: ,
        keyboardType: TextInputType.text,
        controller: controler,
        validator: validator,
        decoration: InputDecoration(
          filled: true,

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),

          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(25)),
          //   borderSide: BorderSide(color: Colors.grey.shade400),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
