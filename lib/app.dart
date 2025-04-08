import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SigninBloc())],
      child: MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => SignInPage(),
          // "/sign_up_page": (context) => SignUpPage(),
          // "/users_home_page": (context) => UsersHomePage(), // users_home_page
        },
      ),
    );
  }
}
