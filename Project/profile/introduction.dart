/**import 'package:flutter/material.dart';
import 'package:profile/homePage.dart';
import '../intro_pages/page1.dart';
import '../intro_pages/page2.dart';
import '../intro_pages/page3.dart';
import '../login.dart';
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
                onLastPage=(index==2);
              });
            },
            children: [
             IntroPage1(),
             IntroPage2(),
             IntroPage3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              //skip
              GestureDetector(
                onTap: (){
                  _controller.jumpToPage(2);
                },
                child: Text('SKIP'),
              ),
              //dot
                SmoothPageIndicator(
                  controller:_controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    activeDotColor: Colors.deepPurple,
                    dotColor: Colors.deepPurple.shade100,
                    dotHeight: 12,dotWidth: 12,spacing: 12,
                  //  verticalOffset: 50,
                  ), ),
             
             
             //next and end-->done
             onLastPage
             ?GestureDetector(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context){
                     // return LoginPage();
                   //  return HomePage();
                    }));
                },
                child: Text('DONE'),
              ): GestureDetector(
               onTap: (){
                  _controller.nextPage(
                    duration: Duration(microseconds: 500), 
                    curve: Curves.easeIn);
                },
                child: Text('NEXT'),
              ),
              ],
             ),
          
          ),
        ],
      ),
    );
  }
}


**/