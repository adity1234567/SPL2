import 'package:flutter/material.dart';
import 'package:profile/homePage.dart';
//import 'package:profile/homePage.dart';
import 'package:profile/introduction.dart';
import 'package:profile/pages/childernOfProfile.dart/editProfile.dart';
//import 'package:profile/pages/bottombar.dart';
import 'package:profile/pages/childernOfProfile.dart/settings.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/try/pro.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
         // home:IntroductionPage(),
        home: BottomNavBar(),
     // home:EditProfile(),
    );
    
  }
}