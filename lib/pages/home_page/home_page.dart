import 'package:flutter/material.dart';
import 'package:selon/pages/home_page/custom_widget/custom_text_form_feild.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController email = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 450),
          CustomTextFormFeild(
            hintText: "Email",
            controler: email,
            labelText: "Emial",
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 10),
          CustomTextFormFeild(
            hintText: "Password",
            controler: email,
            labelText: "Password",
            prefixIcon: Icons.lock,
          ),
        ],
      ),
    );
  }
}
