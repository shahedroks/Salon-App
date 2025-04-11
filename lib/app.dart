import 'package:flutter/material.dart';
import 'package:selon/pages/home_page/users_home_page.dart';
import 'package:selon/pages/onboarding_related_page/onboarding3_page.dart';
import 'package:selon/pages/onboarding_related_page/onboarding4_page.dart';
import 'package:selon/pages/onboarding_related_page/onbroarding1_page.dart';
import 'package:selon/pages/onboarding_related_page/onbroarding2_page.dart';
import 'package:selon/pages/sign_related_page/signin_page.dart';
import 'package:selon/pages/sign_related_page/signup_page.dart';
import 'package:selon/pages/splash_page/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          prefixIconColor: Colors.grey,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/sign_in_page": (context) => SignInPage(),
        "/": (context) => SplashPage(),
        "/sign_up_page": (context) => SignUpPage(),
        "/users_home_page": (context) => UsersHomePage(), // users_home_page
        "/onboarding1": (context) => OnbroardingPage1(), // users_home_page
        "/onboarding2": (context) => OnbroardingPage2(), // users_home_page
        "/onboarding3": (context) => OnbroardingPage3(), // users_home_page
        "/onboarding4": (context) => OnbroardingPage4(), // users_home_page
      },
    );
  }
}
