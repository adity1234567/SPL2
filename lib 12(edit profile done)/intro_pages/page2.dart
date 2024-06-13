/*import 'package:flutter/material.dart';

//img+hi+text+signup+login

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('page2'),
       color:Colors.purple[100],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart';
import '../signup.dart';
//import '../Screen/sign_in.dart';
import 'package:sign_language_tool/Utils/colors.dart';



class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}



class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        //color: Color(0xFFFF3DBCF),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
         // Color(0xFFFF3DBCF),
        //  Color(0xFFFC9BBC8),
         // Color(0xFFFAAC9CE),
         Color(0xfffb684c2),
           Color(0xffff3dbcf),

        ], // Add your desired colors here
        end: Alignment.topLeft,
        begin: Alignment.bottomRight,
      ),
    ),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            //SizedBox(height: 80,),
            Align(
              
              alignment: Alignment.topCenter,
              child: Container(
                
                height: size.height * 0.65,
                width: size.width*0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
       //           color:Color(0xFFFC9BBCB),
                 image: DecorationImage(
                    
                    image: AssetImage(
                      "assets/images/asl2.png",
                      
                    ),
                    
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.5,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Discover your\n dreams",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: textColor1,
                          height: 1.2),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Explore all the most exiting jobs roles\nbased on your interest And study major",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor2,
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: backgroundColor3.withOpacity(0.9),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width*0.45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:Center(
                                  child:Row(
                                    children: [
                                        const Spacer(),
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    ),
                                  );
                                        } ,
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: textColor1,
                                          ),
                                        ),
                                      ),
                                        const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );

                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: textColor1,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}