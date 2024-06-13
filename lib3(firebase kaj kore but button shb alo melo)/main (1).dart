import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../homePage.dart';
//import 'package:profile/homePage.dart';
//import 'package:sign_language_tool/introduction.dart';
import '../pages/childernOfProfile.dart/editProfile.dart';
//import 'package:profile/pages/bottombar.dart';
import '../pages/childernOfProfile.dart/settings.dart';
import 'package:sign_language_tool/pages/profile.dart';
import 'package:sign_language_tool/try/pro.dart';
import 'firebase_options.dart';
import 'package:sign_language_tool/intro_pages/page1.dart';


int? isViewed;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
         // home:IntroductionPage(),
      //  home: BottomNavBar(),
        home:IntroPage1(isViewed:isViewed)
     // home:EditProfile(),
     
    );
    
  }
}