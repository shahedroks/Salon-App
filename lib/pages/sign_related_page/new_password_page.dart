import 'package:flutter/material.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/signin_page.dart';

import '../../utils/users_controler.dart';
import '../../utils/valited_checker_controler.dart';
import 'custom_widget/custom_sign_controler_button.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});
  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

ValitedChecker checker = ValitedChecker();
Users users = Users();
TextEditingController _newPassword = TextEditingController();
TextEditingController _conformPassword = TextEditingController();
final GlobalKey<FormState> isFormKey1 = GlobalKey<FormState>();

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: isFormKey1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizeHeight * 0.1),
                CustomUpperTextControlerSign(
                  firstText: "New password",
                  secondText:
                      "Now, you can create new password and confirm it below",
                ),
                SizedBox(height: sizeHeight * 0.25),
                TextFormField(
                  controller: _newPassword,
                  textInputAction: TextInputAction.next,
                  obscureText: obscureText,
                  validator: (value) => checker.onPasswordChecker(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      onPressed: () => visibilityButton(),
                      icon:
                          !obscureText
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: sizeHeight * 0.02),
                TextFormField(
                  controller: _conformPassword,
                  obscureText: obscureText,
                  validator: (value) => confirmPassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      onPressed: () => visibilityButton(),
                      icon:
                          !obscureText
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                SizedBox(height: sizeHeight * 0.05),
                CustomSignControlerButton(
                  onTap: newPasswordDone,
                  text: "Sign In",
                  contenerColor: Color(0xff156778),
                  textColor: Colors.white,
                  showAvater: false,
                ),
                SizedBox(height: sizeHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? confirmPassword(value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }
    if (value != _newPassword.text) {
      return "Password does not match";
    }
  }

  void newPasswordDone() {
    if (isFormKey1.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
        (predicate) => false,
      );
    }
  }

  bool obscureText = true;
  void visibilityButton() {
    setState(() {
      obscureText = !obscureText;
      print(obscureText);
    });
  }

  void clearText() {
    _newPassword.clear();
    _conformPassword.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _newPassword.dispose();
    _conformPassword.dispose();
  }
}
