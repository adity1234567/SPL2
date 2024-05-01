import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/home.dart';
import 'package:signup/intro_pages/page1.dart';
import 'package:signup/introduction.dart';
import 'package:signup/signup_pages/signupPage1.dart';
//import 'package:signup/signup_pages/signup.dart';


int? isViewed;
void main() async{
   SystemUiOverlayStyle(statusBarColor: Colors.transparent);
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs=await SharedPreferences.getInstance();
   isViewed=prefs.getInt('Signup');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:IntroPage1(isViewed:isViewed),
    );
  }
}