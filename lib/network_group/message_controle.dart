import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selon/model_controler/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageControler {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendMessage(String receiverID, message) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    final String currentUserID = await prefe.getString("email").toString();
    final timestamp = Timestamp.now();
    MessageModel newMessage = MessageModel(
      senderId: currentUserID,
      receiverId: receiverID,
      text: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatID = ids.join("_");
    await _firestore
        .collection('message')
        .doc(chatID)
        .collection("message")
        .add(newMessage.toJson());
  }

  // geting message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatID = ids.join("_");
    return _firestore
        .collection("message")
        .doc(chatID)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  // List<Map<String,dynamic>> =
}
