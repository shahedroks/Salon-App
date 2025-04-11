import 'package:flutter/material.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';

import '../../utils/users_controler.dart';
import '../../utils/valited_checker_controler.dart';
import 'custom_widget/custom_sign_controler_button.dart';
import 'custom_widget/forget_text.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});
  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

ValitedChecker checker = ValitedChecker();
Users users = Users();
TextEditingController email = TextEditingController();
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
                ForgetText(text: "Use Phone Number"),
                SizedBox(height: sizeHeight * 0.05),
                CustomSignControlerButton(
                  onTap: verifyDone,
                  text: "Email Verify",
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

  void verifyDone() {}

  void googleSignIn() {}
  bool obscureText = true;
  void visibilityButton() {
    setState(() {
      obscureText = !obscureText;
      print(obscureText);
    });
  }

  void clearText() {
    email.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
  }
}
