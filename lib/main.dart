import 'package:flutter/material.dart';
import 'package:login/signupScreen.dart';
import 'loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginScreen(),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },
    );
  }
}
