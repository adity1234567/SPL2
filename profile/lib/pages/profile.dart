import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/childernOfProfile.dart/editProfile.dart';
import 'package:profile/pages/childernOfProfile.dart/games.dart';
import 'package:profile/pages/childernOfProfile.dart/notification.dart';
import 'package:profile/pages/childernOfProfile.dart/settings.dart';

class ProfilePage extends StatefulWidget {
  //final PageController pageController;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Text(
            'me me',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          //color:
          // backgroundColor: Colors.transparent,
          //Color(0xFFF70CC95),
          //  Color(0xFFF87D38C),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
               //   Color.fromARGB(255, 86, 212, 189),
                  // Color(0xFFF40BCA6),
                //  Color(0xFFF87D38C),

                Color(0xFFFC9BBCB),
                //Color(0xFFFE7ACCF),
                Color(0xFFFF3DBCF),
                ], // Add your desired colors here
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },

              ///icon: Icon(Icons.settings, color: Colors.black),
              icon: Image.asset(
                'assets/images/settings.gif',
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFFFE7E6ED),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        // color: Color(0xFFF70CC95),
                        gradient: LinearGradient(
                            colors: [
                             Color(0xFFFC9BBCB),
                           Color(0xFFFF3DBCF),
                            ],
                            //  stops: [0.2,0.4,0.5,0.6,0.8,1],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomLeft),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                ],
              ),
              Positioned(
                top: 3,
                left: 37,
                child: Container(
                  height: 250,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 241, 243, 0.9),
                    // color:Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      //profile pic
                      /**     Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          
                        //  color: Colors.grey[700],
                         //Image(image: image)
                        ),
                      ),
                      **/
                      //Color.fromARGB(255, 160, 190, 211)
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/your_image.png', // Replace with your image asset path
                            fit: BoxFit
                                .cover, // Adjust the fit property as needed
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //username
                      Text(
                        'nameee',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        height: 13,
                      ),

                      //edit profile
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(13),
                        
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile()),
                                );
                              },
                              child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            ),   
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFC9BBCB),
                           Color(0xFFFF3DBCF),
                                  ],
                                  //  stops: [0.2,0.4,0.5,0.6,0.8,1],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // TabBar and TabBarView
              Positioned.fill(
                top: 280, // Adjust the position according to your layout
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(
                          icon: Image.asset(
                            'assets/images/notification.gif',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Tab(
                          icon: Image.asset(
                            'assets/images/game.gif',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for the first tab (Notifications)
                          Notifications(),
                          // Content for the second tab (Games)
                          Games(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
