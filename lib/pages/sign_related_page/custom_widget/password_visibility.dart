import 'package:flutter/material.dart';

class PasswordVisibility extends StatefulWidget {
  const PasswordVisibility({super.key});

  @override
  State<PasswordVisibility> createState() => _PasswordVisibilityState();
}

class _PasswordVisibilityState extends State<PasswordVisibility> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          obscureText = !obscureText;
          print(obscureText);
        });
      },
      icon: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
    );
  }
}
