import 'package:flutter/material.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_lower_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizeHeight * 0.1),
                CustomUpperTextControlerSign(
                  firstText: "Welcome Back",
                  secondText:
                      "Glad to meet you again!, please login to use the app..",
                ),
                SizedBox(height: sizeHeight * 0.25),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    final result = checker.onEmailChecker(value);
                    checker.signChecker = true;
                    print(checker.signChecker);
                    return result;
                  },
                ),
                SizedBox(height: sizeHeight * 0.02),
                TextFormField(
                  obscureText: obscureText,
                  validator: (value) {
                    final result = checker.onPasswordChecker(value);
                    checker.signChecker = true;
                    return result;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    suffixIcon: PasswordVisibility(),
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
                      // users.signinAuth(email.text, password.text, context);
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
                  firstText: "Don’t have an account?Don’t have an account?",
                  secondText: "Join Now",
                  onTap: () {
                    Navigator.pushNamed(context, "/sign_up_page");
                  },
                ),
              ],
            ),
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
