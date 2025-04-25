import 'package:flutter/material.dart';
import 'package:selon/utils/assets_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/users_home_page.dart';
import '../onboarding_related_page/onbroarding1_page.dart';

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
          width: sizeWidth * 0.6,
          height: sizeHeight * 0.4,
          child: Column(
            children: [
              Image.asset(ImagesPath.logoImage, fit: BoxFit.cover),
              SizedBox(width: sizeWidth * 0.03),
              Image.asset(ImagesPath.logo1Image, fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }

  void nextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (prefs.getString("token") != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersHomePage()),
        (predicate) => false,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnbroardingPage1()),
      );
    }
  }
}
