import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class FirebaseMsg {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  Logger logger = Logger();

  initsFCM() async {
    await firebaseMessaging.requestPermission();
    var token = await firebaseMessaging.getToken();
    // logger.e(token);
    FirebaseMessaging.onBackgroundMessage(hendleNotification);
    FirebaseMessaging.onMessage.listen(hendleNotification);
  }
}

Future<void> hendleNotification(RemoteMessage msgt) async {}
