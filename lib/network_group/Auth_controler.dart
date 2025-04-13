import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:selon/pages/home_page/users_home_page.dart';
import 'package:selon/pages/sign_related_page/signin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_controler.dart';

class AuthControler {
  FirebaseAuth authstatus = FirebaseAuth.instance;
  var logger = Logger(printer: PrettyPrinter());

  static bool isCerculer = false;

  Future<void> signInAuth({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isCerculer = true;
      await authstatus.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersHomePage()),
        (predicate) => false,
      );
      isCerculer = false;
      logger.i(authstatus.currentUser!.uid.toString());
      DataController.saveToSharedPref(
        name: authstatus.currentUser!.displayName,
        email: email,
        number: authstatus.currentUser!.phoneNumber,
        token: authstatus.currentUser!.uid.toString(),
      );
      toastControler("Sign In Successfully");
    } on FirebaseAuthException catch (e, s) {
      if (e.code == "user-not-found") {
        toastControler("User not found");
      } else if (e.code == "wrong-password") {
        toastControler("Wrong password");
      } else if (e.code == "invalid-email") {
        toastControler("Invalid email");
      } else if (e.code == "user-disabled") {
        toastControler("User disabled");
      } else {
        toastControler("Something went wrong please try again");
      }
    }
  }

  Future<void> signUpAuth({
    String? name,
    required String email,
    String? number,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isCerculer = true;
      var authState = await authstatus.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersHomePage()),
        (predicate) => false,
      );
      isCerculer = false;
      DataController.saveToSharedPref(
        name: name,
        email: email,
        number: number,
        token: authState.user!.uid.toString(),
      );
      toastControler("Sign Up Successfully");
      DataController.SaveUsersData(
        // authState.user!.uid,
        name: name,
        email: email,
        Number: number,
        // authState.user!.uid,
      );
    } on Exception catch (e, s) {
      if (e is FirebaseAuthException) {
        if (e.code == "email-already-in-use") {
          toastControler("Email already in use");
        } else if (e.code == "invalid-email") {
          toastControler("Invalid email");
        } else {
          toastControler("Something went wrong please try again");
        }
      } else {
        toastControler("{Something went wrong please try again}");
      }
    }
  }

  void passwordResetAuth(String email, BuildContext context) async {
    try {
      isCerculer = true;
      await authstatus.sendPasswordResetEmail(email: email);
      isCerculer = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
        (predicate) => false,
      );
      toastControler("Please check your email");
    } catch (e, s) {
      toastControler("Something went wrong please try again");
      logger.e(e.toString());
      logger.e(s.toString());
    }
  }

  static void toastControler(String msg) {
    //
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void loggerControler(String msg) {
    logger.i(msg);
  }
}
