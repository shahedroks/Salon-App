import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Users {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signinAuth(String email, String password, var context) async {
    try {
      var authState = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Fluttertoast .showToast(
      //     msg: "Login Successful!",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      Navigator.pushNamed(context, "/users_home_page");
    } catch (e, s) {
      print("Users error $e");
      print("Users error $s");
    }
  }
}
