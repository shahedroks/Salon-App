import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selon/firebase_options.dart';
import 'package:selon/pages/home_page/users_home_page.dart';
import 'package:selon/pages/signin_page/state_management/bloc/signin_bloc.dart';
import 'package:selon/pages/signup_page/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SigninBloc())],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/gfhwg": (context) => SignUpPage(),
          "/": (context) => UsersHomePage(), // users_home_page
        },
      ),
    );
  }
}
