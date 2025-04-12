import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:selon/pages/home_page/users_home_page.dart';

class Users {
  FirebaseAuth auth = FirebaseAuth.instance;
  var logger = Logger(printer: PrettyPrinter());

  Future<void> signInAuth(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersHomePage()),
        (predicate) => false,
      );
      toastControler("Sign In Successfully");
    } catch (e, s) {
      toastControler("${e.toString()}");
      logger.e(e.toString());
      logger.e(s.toString());
    }
  }

  Future<void> signUpAuth(String email, String password, var context) async {
    try {
      var authState = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UsersHomePage()),
        (predicate) => false,
      );
      toastControler("Join Successfully");
    } catch (e, s) {
      toastControler("${e.toString()}");
      logger.e(e.toString());
      logger.e(s.toString());
    }
  }

  void toastControler(String msg) {
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
