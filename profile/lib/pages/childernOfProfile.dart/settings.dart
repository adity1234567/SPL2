import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/pages/profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = false;
  bool valNotify2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            leading: IconButton(
              icon: Image.asset('assets/images/arrow2.gif'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFC9BBCB), // First color
                      Color(0xFFFF3DBCF), // Second color
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              
              children: [
                SizedBox(height: 20),
                buildNotificationOption(
                  "Allow camera or not",
                  valNotify1,
                  (bool value) {
                    setState(() {
                      valNotify1 = value;
                    });
                  },
                ),
                buildNotificationOption(
                  "Notify or not",
                  valNotify2,
                  (bool value) {
                    setState(() {
                      valNotify2 = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About this app!!!",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Give Attention....'),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("No,thanks"),
                                      Text("Logout.."),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Image.asset('assets/images/logout.gif', height: 50, width: 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildNotificationOption(String title, bool value, Function(bool) onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: onChangeMethod,
            ),
          ),
        ],
      ),
    );
  }
}
