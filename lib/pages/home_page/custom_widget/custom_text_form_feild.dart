import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  String? hintText;
  String? labelText;
  var controler;
  IconData prefixIcon;
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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        // validator: ,
        keyboardType: TextInputType.text,
        controller: controler,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: Icon(prefixIcon),

          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     borderSide: BorderSide(color: Colors.grey)),
          // focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.black),
          //     borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
