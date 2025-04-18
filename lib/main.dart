import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selon/app.dart';
import 'package:selon/firebase_massage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMsg().initsFCM();
  runApp(const MyApp());
}
