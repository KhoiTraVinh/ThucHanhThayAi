import 'package:flutter/material.dart';
import './Components/Body.dart';

class SignInPage extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
