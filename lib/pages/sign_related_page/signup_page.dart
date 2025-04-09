import 'package:flutter/material.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_lower_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/utils/checker_controler.dart';
import 'package:selon/pages/sign_related_page/utils/users_controler.dart';

import 'custom_widget/custom_divider.dart';
import 'custom_widget/custom_signIn_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

Checker checker = Checker();
Users users = Users();
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController password = TextEditingController();
final GlobalKey<FormState> isFormKey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: isFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizeHeight * 0.1),
                CustomUpperTextControlerSign(
                  firstText: "Create an account,",
                  secondText:
                      "Please type full information bellow and we can create your account",
                ),
                SizedBox(height: sizeHeight * 0.10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Name",
                  ),
                ),
                SizedBox(height: sizeHeight * 0.02),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                  validator: (value) => checker.onEmailChecker(value),
                ),
                SizedBox(height: sizeHeight * 0.02),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return checker.onNumberChecker(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    hintText: "Number",
                  ),
                ),
                SizedBox(height: sizeHeight * 0.02),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: obscureText,
                  validator: (value) => checker.onPasswordChecker(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () => visibilityButton(),
                      icon:
                          !obscureText
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                Text.rich(
                  style: TextStyle(fontSize: 16),
                  TextSpan(
                    text: "By signing up you agree to our ",
                    style: TextStyle(color: Colors.black), // default color
                    children: [
                      TextSpan(
                        text: "Term of use and privacy",
                        style: TextStyle(
                          color: Color(0xff156778),
                        ), // only this part colored
                      ),
                      TextSpan(text: " notic"),
                    ],
                  ),
                ),
                SizedBox(height: sizeHeight * 0.05),
                CustomSigninButton(
                  signControler: () {
                    if (isFormKey.currentState!.validate()) {
                      users.signUpAuth(email.text, password.text, context);
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
                CustomLowerTextControlerSign(
                  firstText: "Already have an account?",
                  secondText: "Sign Now",
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool obscureText = true;
  void visibilityButton() {
    obscureText = !obscureText;
    setState(() {});
  }
}

@override
void Dispose() {
  name.dispose();
  email.dispose();
  number.dispose();
  password.dispose();
}
