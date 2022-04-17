import 'package:flutter/cupertino.dart';
import './SignIn/signInPage.dart';
import './SignUp/signUpPage.dart';
import './SplashPage/SplashPage.dart';
import './category/category_page.dart';
import './homepage/homepage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  CategoryPage.routeName: (context) => CategoryPage()
};
