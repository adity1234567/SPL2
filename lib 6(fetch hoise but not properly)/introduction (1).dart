/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signup/model/signup_data.dart';

import '/home.dart';

class HelloPage extends StatefulWidget {
   const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: SignupContents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                 
                  child: Column(
                    children: [
                       SizedBox(height:30,),
                      Image.asset(
                        SignupContents[i].image,
                        height: 300,
                      ),
                      Text(
                        SignupContents[i].title,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        SignupContents[i].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                SignupContents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: TextButton(
            /*  style:ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.indigo),
                overlayColor: WidgetStateProperty.all<Color>(Colors.blueGrey),
              ),*/

              
              child: Text(
                  currentIndex == SignupContents.length - 1 ? "Continue" : "Next"),
              onPressed: () {
                if (currentIndex == SignupContents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Home(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor:WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              //  fixedSize: WidgetStateProperty.all(Size.fromWidth(50))
),

             
              
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

*/

















import 'package:flutter/material.dart';
import '../home.dart';
import '../main.dart';
//import 'package:profile/homePage.dart';
import 'intro_pages/page1.dart';
import 'intro_pages/page2.dart';
import 'intro_pages/page3.dart';
import 'login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _controller=PageController();
 bool onLastPage=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
               onLastPage=(index==1);
              });
            },
            children: [
             IntroPage1(),
             IntroPage2(),
          //   IntroPage3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              //skip
              /*GestureDetector(
              onTap: (){
                  _controller.jumpToPage(2);
                },
                child: Text('SKIP'),
              ),*/
              //dot
                SmoothPageIndicator(
                  controller:_controller,
                  count: 1,
                  effect: JumpingDotEffect(
                    activeDotColor: Color.fromARGB(255, 200, 223, 238),
                    dotColor: Colors.deepPurple.shade100,
                    dotHeight: 12,dotWidth: 12,
                    //spacing: 12,
                  //  verticalOffset: 50,
                  ), ),
             
             
             //next and end-->done
            /* onLastPage
             ?GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context){
                     // return LoginPage();
                     return Home();
                    }));
                },
                child: Text('DONE'),
              ):*/
               onLastPage?
               GestureDetector(
               onTap: (){
                  _controller.nextPage(
                    duration: Duration(microseconds: 500), 
                    curve: Curves.easeIn);
                },
               child:Container(),
              ): GestureDetector(
               onTap: (){
                /*  _controller.nextPage(
                    duration: Duration(microseconds: 500), 
                    curve: Curves.easeIn);*/

                   // isViewed!=0?
                },
                child: Text('NEXT'),
              )

              ],
             ),
          
          ),
        ],
      ),
    );
  }
}


