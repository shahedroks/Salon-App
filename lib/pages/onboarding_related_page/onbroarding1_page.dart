import 'package:flutter/material.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/boarding_iamge.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/dot_indicator.dart';
import 'package:selon/pages/onboarding_related_page/onbroarding2_page.dart';
import 'package:selon/pages/sign_related_page/signup_page.dart';
import 'package:selon/utils/assets_path.dart';
import 'package:selon/utils/color_path.dart';

import '../sign_related_page/custom_widget/custom_lower_text_controler_sign.dart';
import '../sign_related_page/custom_widget/custom_sign_controler_button.dart';
import 'Custom_widget/boarding_upper_text.dart';

class OnbroardingPage1 extends StatelessWidget {
  const OnbroardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    PageController pageController = PageController();
    return OnBoardingImage(
      image: ImagesPath.OnBoarding1Image,
      child: Scaffold(
        backgroundColor: ColorPath.boardingImageColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: sizeHeight * 0.60),
              BoardingUpperText(
                text1: "Best Stylist For You",
                text2: "Styling your appearance \n according to your lifestyle",
              ),
              SizedBox(height: sizeHeight * 0.15),
              DotIndicator(currentIndex: 0),
              SizedBox(height: sizeHeight * 0.01),

              CustomSignControlerButton(
                onTap: () {
                  nextPage(context);
                },
                text: "Next",
                contenerColor: Color(0xff156778),
                textColor: Colors.white,
                showAvater: false,
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnbroardingPage2()),
    );
  }
}
