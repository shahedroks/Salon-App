import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_upper_text_controler_sign.dart';

import '../../utils/users_controler.dart';
import '../../utils/valited_checker_controler.dart';
import 'custom_widget/custom_sign_controler_button.dart';
import 'custom_widget/forget_text.dart';
import 'new_password_page.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});
  @override
  State<OTPPage> createState() => _OTPPageState();
}

ValitedChecker checker = ValitedChecker();
Users users = Users();
TextEditingController _otpControler = TextEditingController();
final GlobalKey<FormState> isFormKey1 = GlobalKey<FormState>();

class _OTPPageState extends State<OTPPage> {
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
                  firstText: "Email verification,",
                  secondText: "Please type OTP code that we give you..",
                ),
                SizedBox(height: sizeHeight * 0.30),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: sizeHeight * 0.06,
                    fieldWidth: sizeWidth * 0.12,
                    activeFillColor: Colors.grey.shade300,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),

                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  controller: _otpControler,
                  appContext: context,
                  onCompleted: (v) {},
                ),
                SizedBox(height: sizeHeight * 0.02),
                ForgetText(text: "Use Phone Number"),
                SizedBox(height: sizeHeight * 0.05),
                CustomSignControlerButton(
                  onTap: verifyDone,
                  text: "Verify Email",
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

  void verifyDone() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPasswordPage()),
    );
  }

  void googleSignIn() {}
  bool obscureText = true;

  void clearText() {
    _otpControler.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpControler.dispose();
  }
}
