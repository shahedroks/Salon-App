import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;

  final String receiverId;
  final String text;
  final Timestamp timestamp;
  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
      timestamp: json['timestamp'],
    );
  }
}
