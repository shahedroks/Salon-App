import 'package:flutter/material.dart';
import 'package:selon/pages/onboarding_related_page/onbroarding1_page.dart';
import 'package:selon/utils/assets_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff156778),
      body: Center(
        child: Container(
          width: sizeWidth * 0.5,
          height: sizeHeight * 0.1,
          child: Image.asset(AssetsPath.logoImage, fit: BoxFit.cover),
        ),
      ),
    );
  }

  void nextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnbroardingPage1()),
    );
  }
}
