import 'package:flutter/material.dart';
import 'package:selon/pages/home_page/custom_function/email_checker.dart';
import 'package:selon/pages/home_page/custom_function/password_check.dart';
import 'package:selon/pages/home_page/custom_widget/custom_divider.dart';
import 'package:selon/pages/home_page/custom_widget/custom_signIn_button.dart';
import 'package:selon/pages/home_page/custom_widget/custom_text_form_feild.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController email = TextEditingController();
final GlobalKey<FormState> isFormKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: isFormKey,
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
            SizedBox(height: sizeHeight * 0.3),
            CustomTextFormFeild(
              suffixIcon: Icons.remove_red_eye,
              hintText: "Email",
              controler: email,
              labelText: "Emial",
              prefixIcon: Icons.email,
              validator: (value) => onEmailChecker(value),
            ),
            SizedBox(height: sizeHeight * 0.02),
            CustomTextFormFeild(
              validator: (value) => onPasswordChecker(value),
              suffixIcon: Icons.remove_red_eye,
              hintText: "Password",
              controler: email,
              labelText: "Password",
              prefixIcon: Icons.lock,
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
    );
  }
}
