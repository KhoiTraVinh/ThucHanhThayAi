import 'package:flutter/material.dart';
import './SignIn/signInPage.dart';
import './SignUp/signUpPage.dart';
import './SplashPage/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}
