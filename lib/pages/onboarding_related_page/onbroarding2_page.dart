import 'package:flutter/material.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/boarding_iamge.dart';
import 'package:selon/pages/onboarding_related_page/Custom_widget/boarding_upper_text.dart';
import 'package:selon/pages/onboarding_related_page/onboarding3_page.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_lower_text_controler_sign.dart';
import 'package:selon/pages/sign_related_page/custom_widget/custom_sign_controler_button.dart';
import 'package:selon/utils/color_path.dart';

class OnbroardingPage2 extends StatelessWidget {
  const OnbroardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return OnBoardingImage(
      child: Scaffold(
        backgroundColor: ColorPath.boardingImageColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: sizeHeight * 0.55),
              BoardingUpperText(
                text1: "Meet Our Specialists",
                text2:
                    "There are many best stylists from \n all the best salons ever",
              ),
              SizedBox(height: sizeHeight * 0.2),

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
                onTap: () {
                  Navigator.pushNamed(context, "/sign_in_page");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  nextPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnbroardingPage3()),
    );
  }
}
