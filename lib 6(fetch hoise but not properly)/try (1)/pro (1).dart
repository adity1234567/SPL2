import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/childernOfProfile.dart/games.dart';
import '../pages/childernOfProfile.dart/notification.dart';
import '../pages/childernOfProfile.dart/settings.dart';

class ProfilePage1 extends StatefulWidget {
  //final PageController pageController;
  const ProfilePage1({super.key});

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Text(
            'me me',
          ),
          //color:
          // backgroundColor: Colors.transparent,
          //Color(0xFFF70CC95),
          //  Color(0xFFF87D38C),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 86, 212, 189),
                  // Color(0xFFF40BCA6),
                  Color(0xFFF87D38C),
                ], // Add your desired colors here
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
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
                              Color.fromARGB(255, 86, 212, 189),
                              // Color(0xFFF40BCA6),
                              Color(0xFFF87D38C),
                            ],
                            //  stops: [0.2,0.4,0.5,0.6,0.8,1],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                  ),
                ],
              ),
              Positioned(
                top: 5,
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
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 86, 212, 189),
                                    Color(0xFFF87D38C),
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
