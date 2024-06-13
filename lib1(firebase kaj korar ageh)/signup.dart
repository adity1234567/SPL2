import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home.dart';
import '../signup_pages/signupPage1.dart';
import '../signup_pages/signupPage2.dart';
import '../signup_pages/signupPage3.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  String _name = '';
  String _email = '';
  String _password = '';

  Future<void> _storeOnBoardInfo() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      await userCredential.user!.updateDisplayName(_name);
      await FirestoreServices.saveUser(_name, _email, userCredential.user!.uid);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('Signup', 1);
      await prefs.setString('name', _name);
      await prefs.setString('email', _email);
    } catch (e) {
      print('Error: $e');
      // Handle error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2);
                  });
                },
                children: [
                  SignupPage1(onNameChanged: (name) => _name = name),
                  SignupPage2(onEmailChanged: (email) => _email = email),
                  SignupPage3(onPasswordChanged: (password) => _password = password),
                ],
              ),
              Container(
                alignment: Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: JumpingDotEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.deepPurple.shade900,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 12,
                      ),
                    ),
                    onLastPage
                        ? GestureDetector(
                            onTap: () async {
                              await _storeOnBoardInfo();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainHomePage(),
                                ),
                              );
                            },
                            child: Text(
                              'DONE',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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

class FirestoreServices {
  static Future<void> saveUser(String name, String email, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({'email': email, 'name': name});
    } catch (e) {
      print('Error saving user: $e');
      // Handle error appropriately
    }
  }
}
