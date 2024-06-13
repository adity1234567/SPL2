import 'package:flutter/material.dart';
import '../pages/childernOfProfile.dart/games.dart';
import '../pages/childernOfProfile.dart/notification.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Camera Page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.camera_alt, color: Colors.black),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.notification_add,
                  color: Colors.red,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.grid_3x3,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Content for the first tab (Notifications)
            Notifications(),
            // Content for the second tab (Games)
            Games(),
          ],
        ),
      ),
    );
  }
}
