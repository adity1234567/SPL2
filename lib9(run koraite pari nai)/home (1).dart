import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    /**return Container(
      child: Center(child: Text('Camera'),),
    );
    **/

     return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
    );
  }
}