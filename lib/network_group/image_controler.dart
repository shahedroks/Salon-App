import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:selon/model_controler/service_model.dart';

class ImageController {
  List<String> images = [];
  static String profiledownloadImageurl = "";
  static String coverdownloadImageurl = "";

  void addImage(String imagePath) {
    images.add(imagePath);
  }

  void removeImage(String imagePath) {
    images.remove(imagePath);
  }

  static Future<List<ServiceModel>?> getService() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("service").get();
      return snapshot.docs
          .map(
            (doc) =>
                ServiceModel.fromJson(doc.data() as Map<String, dynamic>)
                  ..id = doc.id,
          )
          .toList();
    } catch (e) {
      print("Error fetching services: $e");
      return null;
    }
  }

  static Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      // File name generate
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to firebase storage path
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('$fileName.jpg');

      // Upload file
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // Get download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadImageurl = downloadUrl;
    } catch (e) {
      print('Upload Error: $e');
      return null;
    }
  }
}
