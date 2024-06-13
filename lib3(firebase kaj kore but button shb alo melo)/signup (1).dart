import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home.dart';
import '../signup_pages/signupPage1.dart';
import '../signup_pages/signupPage2.dart';
import '../signup_pages/signupPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  String name = '';
  String email = '';
  String password = '';

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Signup', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
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
                SignupPage1(
                  onNameChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SignupPage2(
                  name: name,
                  onEmailChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SignupPage3(
                  name: name,
                  email: email,
                  onPasswordChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
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
                            _storeOnBoardInfo();
                            await Firebase.initializeApp();
                            FirebaseFirestore firestore = FirebaseFirestore.instance;

                            firestore.collection('users').add({
                              'name': name,
                              'email': email,
                              'password': password, // In a real app, hash the password before storing
                            }).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('User Added')),
                              );
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to add user: $error')),
                              );
                            });

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
    );
  }
}
