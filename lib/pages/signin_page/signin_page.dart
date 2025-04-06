import 'package:flutter/material.dart';
import 'package:selon/pages/signIn_page/custom_widget/custom_text_form_feild.dart';

import 'custom_function/email_checker.dart';
import 'custom_function/password_check.dart';
import 'custom_widget/custom_divider.dart';
import 'custom_widget/custom_signIn_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

bool obscureText = true;
bool suffixIcon = false;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
final GlobalKey<FormState> isFormKey = GlobalKey<FormState>();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: isFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeHeight * 0.1),
              Container(
                margin: EdgeInsets.only(left: sizeWidth * 0.03),
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: sizeWidth * 0.06),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: sizeWidth * 0.03),
                child: Text(
                  "Glad to meet you again!, please login to use the app..",
                ),
              ),
              SizedBox(height: sizeHeight * 0.2),
              CustomTextFormFeild(
                // suffixIcon: null,
                obscureText: false,
                hintText: "Email",
                controler: email,
                // labelText: "Emial",
                prefixIcon: Icons.email,
                validator: (value) => onEmailChecker(value),
                onPressed: () {},
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomTextFormFeild(
                validator: (value) => onPasswordChecker(value),
                suffixIcon: suffixIcon ? Icons.visibility : Icons.visibility_off,
          
                hintText: "Password",
                controler: password,
                // labelText: "Password",
                prefixIcon: Icons.lock,
                obscureText: obscureText,
                onPressed: () {
                  setState(() {
                    suffixIcon = !suffixIcon;
                    obscureText = !obscureText;
                  });
                },
              ),
          
              Container(
                padding: EdgeInsets.symmetric(vertical: sizeHeight * 0.01),
                margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Color(0xff156778)),
                ),
              ),
              SizedBox(height: sizeHeight * 0.05),
              CustomSigninButton(
                signIn: () {
                  if (isFormKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/users_home_page");
                  }
                },
                text: "Sign In",
                contenerColor: Color(0xff156778),
                textColor: Colors.white,
                showAvater: false,
              ),
              SizedBox(height: sizeHeight * 0.03),
              CustomDivider(),
              SizedBox(height: sizeHeight * 0.03),
              CustomSigninButton(
                textColor: Color(0xff156778),
                text: "Sign In With Google",
                contenerColor: Colors.white,
                image: "assets/Google.png",
              ),
              SizedBox(height: sizeHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?"),
                  SizedBox(width: sizeWidth * 0.02),
                  Text(
                    "Join Now",
                    style: TextStyle(color: Color(0xff156778), fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
