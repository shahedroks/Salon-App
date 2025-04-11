import 'package:flutter/material.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/boarding_iamge.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/boarding_upper_text.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_lower_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_sign_controler_button.dart';
import 'package:selon/pages/sign_related_page/signup_page.dart';
import 'package:selon/utils/assets_path.dart';
import 'package:selon/utils/color_path.dart';

class OnbroardingPage4 extends StatelessWidget {
  const OnbroardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return OnBoardingImage(
      image: ImagesPath.OnBoarding4Image,
      child: Scaffold(
        backgroundColor: ColorPath.boardingImageColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: sizeHeight * 0.50),
              BoardingUpperText(
                text1: "Let’s Join with Us",
                text2:
                    "Find and book Beauty, Salon, Barber /n and Spa services anywhere, anytime",
              ),
              SizedBox(height: sizeHeight * 0.15),
              CustomSignControlerButton(
                textColor: Color(0xff156778),
                text: "Sign In With Google",
                contenerColor: Colors.white,
                image: "${ImagesPath.googleImage}",
                onTap: googleSignIn,
              ),
              SizedBox(height: sizeHeight * 0.02),
              CustomSignControlerButton(
                onTap: () {
                  nextPage(context);
                },
                text: "Join The Email",
                contenerColor: Color(0xff156778),
                textColor: Colors.white,
                icon: Icons.email,
                showAvater: true,
              ),
              CustomLowerTextControlerSign(
                firstText: "Already have an account?",
                secondText: "Sign Now",
                onTap: () => singUpPage(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void singUpPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  nextPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
      (predicate) => false,
    );
  }

  void googleSignIn() {}
}
