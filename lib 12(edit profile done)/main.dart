import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/course_content.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/course_detail.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';
import 'package:sign_language_tool/pages/lesson_page.dart';

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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Assign a value to isViewed before using it
  isViewed = 0; // Or some value based on your logic

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      // home:IntroductionPage(),
      home: BottomNavBar(userId: 'RwsyKCPlszma4XBm5KP6',),
     // home:LessonPage(),
    //home:ItemWidget('1'),
    
  //  home: CoursesDetail(id:'1',imgDetail: 'AD',price:'1',title: 'aa',)
  //home:CourseContent(id:'2'),
    //  home: IntroPage1(isViewed: isViewed),
   //  home:const ItemWidget(id: '1',),
    );
  }
}
