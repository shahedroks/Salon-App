import 'package:flutter/material.dart';
import 'package:selon/pages/signIn_page/custom_widget/custom_signIn_button.dart';
import 'package:selon/pages/signIn_page/custom_widget/custom_text_form_feild.dart';
import 'package:selon/pages/sign_related_page/utils/checker_controler.dart';
import 'package:selon/pages/sign_related_page/utils/users_controler.dart';

import '../signIn_page/custom_widget/custom_divider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool obscureText = true;
bool suffixIcon = false;

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
              SizedBox(height: sizeHeight * 0.15),
              CustomTextFormFeild(
                // suffixIcon: null,
                obscureText: false,
                hintText: "Name",
                controler: name,
                // labelText: "Emial",
                prefixIcon: Icons.person,
                validator: (value) => checker.onEmailChecker(value),
                onPressed: () {},
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomTextFormFeild(
                // suffixIcon: null,
                obscureText: false,
                hintText: "Email",
                controler: email,
                // labelText: "Emial",
                prefixIcon: Icons.email,
                validator: (value) => checker.onEmailChecker(value),
                onPressed: () {},
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomTextFormFeild(
                // suffixIcon: null,
                obscureText: false,
                hintText: "Number",
                controler: number,
                // labelText: "Emial",
                prefixIcon: Icons.numbers,
                validator: (value) => checker.onEmailChecker(value),
                onPressed: () {},
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomTextFormFeild(
                validator: (value) => checker.onPasswordChecker(value),
                suffixIcon:
                    suffixIcon ? Icons.visibility : Icons.visibility_off,

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

              // Container(
              //   padding: EdgeInsets.symmetric(vertical: sizeHeight * 0.01),
              //   margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
              //   alignment: Alignment.topRight,
              //   child: Text(
              //     "Forgot Password",
              //     style: TextStyle(color: Color(0xff156778)),
              //   ),
              // ),
              SizedBox(height: sizeHeight * 0.05),
              CustomSigninButton(
                signIn: () {
                  if (isFormKey.currentState!.validate()) {
                    users.signinAuth(email.text, password.text, context);
                    // if(users == true){
                    //   print("ok");
                    //   Navigator.pushNamed(context, "/users_home_page");
                    // }else {
                    //   print("error loging");
                    // }
                  }
                },
                text: "Sign Up",
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
