import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup/home.dart';
import 'package:signup/intro_pages/page2.dart';


//logo+title




class IntroPage1 extends StatefulWidget {
 
  final int? isViewed;
  const IntroPage1({super.key, this.isViewed});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}
class _IntroPage1State extends State<IntroPage1> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => widget.isViewed!=0 ? Home():IntroPage2(),
      ));
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     // child: Text('page1'),
      color:Colors.pink[100],
    );
  }
}