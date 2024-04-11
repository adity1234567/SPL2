import 'package:dashboard/camera.dart';
import 'package:dashboard/home.dart';
import 'package:dashboard/routes.dart';
import 'package:dashboard/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navBar.dart';
import '../profile.dart';
import '../root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
     home:Navbar(),
    routes: {
    MyRoutes.profileRoute: (context) => Profile(),

     MyRoutes.widgetRoute: (context) => Widgets(),
      MyRoutes.homeRoute: (context) => Home(),
       MyRoutes.cameraRoute: (context) => Camera(),
    // Other routes...
  },
   /*  initialRoute: MyRoutes.profileRoute,

      routes:{
     //   "/": (context) => LoginPage(),
      //  "/home": (context) => HomePage(),
      MyRoutes.profileRoute: (context) => Profile(),
      //  "/login": (context) => LoginPage(),
     // MyRoutes.loginRoute: (context) => LoginPage(),
      }
      */
    );
  }
}
