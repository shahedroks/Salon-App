import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:selon/pages/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController {
  static Logger logger = Logger(printer: PrettyPrinter());
  static final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];
  static get color => _colors;
  static void SaveUsersData({
    String? name,
    required String email,
    String? Number,
    String? password,
  }) async {
    await FirebaseFirestore.instance.collection("users").doc(email).set({
      "name": name,
      "email": email,
      "Number": Number,
      "password": password,
      "role": "user",
    });
  }

  static void saveToSharedPref({
    String? name,
    required String email,
    String? number,
    required String token,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name ?? "");
    prefs.setString("email", email);
    prefs.setString("number", number ?? "");
    prefs.setString("token", token);
  }

  static Future<UsersModel?> getUsersData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");

    if (email != null && email.isNotEmpty) {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("users").doc(email).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        UsersModel user = UsersModel.fromJson(data);
        print("this is  a data ${user}"); // debug output
      }
    }
    return null;
  }
}
