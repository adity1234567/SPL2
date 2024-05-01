import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('page2'),
       color:Colors.purple[100],
    );
  }
}