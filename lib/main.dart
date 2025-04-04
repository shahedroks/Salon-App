import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selon/pages/home_page/users_home_page.dart';
import 'package:selon/pages/signIn_page/signin_page.dart';
import 'package:selon/pages/signin_page/state_management/bloc/signin_bloc.dart';

void main() {
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
          "/": (context) => SignInPage(),
          "/users_home_page": (context) => UsersHomePage(),
        },
      ),
    );
  }
}
