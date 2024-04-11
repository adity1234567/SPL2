//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dashboard/routes.dart';

import '../constants.dart';
import '../router.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex=0;
  late PageController _pageController;

  void initState(){
    super.initState();
    _pageController=PageController();
  }
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SizedBox.expand(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
     ),
      bottomNavigationBar: Container(
         
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: EdgeInsets.all(14),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                   onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                ),
                GButton(
                  icon: Icons.widgets,
                  text: 'Widgets',
                   onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.widgetRoute);
                  },
                ),
                GButton(
                  icon: Icons.photo_camera,
                  text: 'Camera',
                   onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.cameraRoute);
                  },
                ),
                GButton(
                    icon: Icons.person,
                    text: 'Profile',
                     onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.profileRoute);
                  },
                  ),
                
              ],
            ),
          ),
        ),
      );
    
  }
}

