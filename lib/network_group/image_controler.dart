import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:selon/model_controler/service_model.dart';

class ImageController {
  List<String> images = [];

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
}
