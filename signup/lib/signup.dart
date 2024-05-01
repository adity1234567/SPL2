import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/home.dart';
import 'package:signup/signup_pages/signupPage1.dart';
import 'package:signup/signup_pages/signupPage2.dart';
import 'package:signup/signup_pages/signupPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}


 _storeOnBoardInfo() async{
  int isViewed=0;
  SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setInt('Signup', isViewed);
}
 
class _SignupPageState extends State<SignupPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents widget from moving up when keyboard is displayed
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
                  SignupPage1(),
                  SignupPage2(),
                  SignupPage3(),
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
                       // alignment: Alignment.centerRight,
                    ),
                    onLastPage
                        ? GestureDetector(
                            onTap: () async{
                              _storeOnBoardInfo();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home()
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
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text('NEXT',style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
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
