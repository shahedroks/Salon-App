import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:selon/model_controler/users_model.dart';
import 'package:selon/network_group/image_controler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController {
  static Logger logger = Logger(printer: PrettyPrinter());
  static bool isCerculerDataControler = false;
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

  static Future<UsersModel?> getSignUsersData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    String? email = prefs.getString("email");
    isCerculerDataControler = true;
    if (email != null && email.isNotEmpty) {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("users").doc(email).get();

      if (snapshot.exists) {
        isCerculerDataControler = true;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        UsersModel user = UsersModel.fromJson(data);
        isCerculerDataControler = false;
        return user;
      }
    }
    return null;
  }

  static Future<List<UsersModel>?> getAllUsers() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? email = sharedPref.getString("email");
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("users")
            .where("email", isNotEqualTo: email)
            .get();

    return snapshot.docs.map((doc) {
      return UsersModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  static void updateData({
    required String name,
    required String email,
    required String bio,
    required String adderss,
    required String gender,
    required String number,
    required String username,
    File? profileFilePath,
    File? coverFilePath,
    required String coverIamgeUrl,
    required String profileImageUrl,
    required bool isCover,
  }) async {
    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;

      String newProfileUrl = profileImageUrl;
      String newCoverUrl = coverIamgeUrl;

      if (profileFilePath != null) {
        String? uploadProfileImage =
            await ImageController.uploadImageToFirebase(
              imageFile: profileFilePath,
              isCover: false,
            );
        if (uploadProfileImage != null) {
          newProfileUrl = uploadProfileImage;
        }
      }
      if (coverFilePath != null) {
        String? uploadcoverImage = await ImageController.uploadImageToFirebase(
          imageFile: coverFilePath,
          isCover: true,
        );
        if (uploadcoverImage != null) {
          newCoverUrl = uploadcoverImage;
        }
      }
      instance.collection("users").doc("$email").set({
        "bio": "$bio",
        "name": "$name",
        "address": "$adderss",
        "gender": "$gender",
        "number": "$number",
        "username": "$username",
        "cover_image": "$coverIamgeUrl",
        "image": "$profileImageUrl",
      }, SetOptions(merge: true));
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
