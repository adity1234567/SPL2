/*import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:profile/pages/camera.dart';
import 'package:profile/pages/childernOfProfile.dart/settings.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/lesson_page.dart';
import 'package:profile/pages/profile.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex=0;
  late PageController _pageController;
 /* void _navigatorBottomBar(int index)
  {
    setState(() {
      _selectedIndex=index;
      
    });
  }*/
   @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  void _navigatorBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

 /* final List<Widget>_pages=[
    MainHomePage(),
 //  Settings(),
    LessonPage(),
    CameraPage(),
    ProfilePage(),
  ];
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ekhane ekta list ar sathe map kora lagbe..jeno oi ta tap dile oi page show kpre
      // body: _pages[_selectedIndex],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          MainHomePage(),
          LessonPage(),
          CameraPage(),
          ProfilePage(),
        ],
      ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigatorBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            
            label: _selectedIndex == 0 ? 'Home' : '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_lesson),
            label: _selectedIndex == 1 ? 'Lessons' : '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_sharp),
            label: _selectedIndex == 2 ? 'Camera' : '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: _selectedIndex == 3 ? 'Profile' : '',
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sign_language_tool/pages/uploadImage.dart';
import '../pages/camera.dart';
import '../pages/profile.dart';
import '../pages/lesson_page.dart';

class BottomNavBar extends StatefulWidget {
  final String userId;

  const BottomNavBar({Key? key, required this.userId}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16.0),
            tabs: const [
              GButton(
                icon: Icons.play_circle_filled,
                text: 'Lessons',
              ),
              GButton(
                icon: Icons.camera_alt,
                text: 'Camera',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          LessonPage(), // Replace with your actual Lessons page widget
          CameraPage(),
          ProfilePage(userId: widget.userId),
        ],
      ),
    );
  }
}
