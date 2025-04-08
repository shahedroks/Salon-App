import 'package:flutter/material.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_text_form_feild.dart';
import 'package:selon/pages/sign_related_page/custom_widget/password_visibility.dart';
import 'package:selon/pages/sign_related_page/utils/checker_controler.dart';
import 'package:selon/pages/sign_related_page/utils/users_controler.dart';

import 'custom_widget/custom_divider.dart';
import 'custom_widget/custom_signIn_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

bool obscureText = true;
Checker checker = Checker();
Users users = Users();
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
              CustomContainerTextFormFeild(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                  validator: (value) => checker.onEmailChecker(value),
                ),
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomContainerTextFormFeild(
                child: TextFormField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    suffixIcon: PasswordVisibility(),
                  ),
                ),
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
                    users.signinAuth(email.text, password.text, context);
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

@override
void Dispose() {
  email.dispose();
  password.dispose();
}
