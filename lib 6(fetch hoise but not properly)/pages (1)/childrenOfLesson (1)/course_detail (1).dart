import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/LessonTile.dart';
import '../../pages/ChildrenOfLesson/course_content.dart';
import 'package:sign_language_tool/constants.dart';

class CoursesDetail extends StatefulWidget {

  final String imgDetail;
  final String title;
  final String price;

  const CoursesDetail({
    super.key,
    required this.imgDetail,
    required this.title,
    required this.price,
  });

  @override
  State<CoursesDetail> createState() => _CoursesDetailState();
}

class _CoursesDetailState extends State<CoursesDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                    bottom: 600,
                    child: Container(
                      height: size.height*0.55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.imgDetail),
                            // This allows the course detail screen to display a 
                            //specific image associated with the course being viewed.
                            fit: BoxFit.fitWidth),
                      ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          )
                        ],
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                         
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // for title
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // for rating and no of user
                          Row(
                            children: [
                              
                            
                                  SvgPicture.asset(
                                    "assets/images/user_icon.svg",
                                  ),
                                
                              
                              const SizedBox(
                                width: 25,
                              ),
                             
                                ],
                              ),
                            ],
                          ),
                         
                        
                          
                        
                      ),
                    
                  ],
                ),
                CourseContent(size: size)
                //LessonTile()
              ],
            )
          ],
        ),
      ),
  //    bottomSheet: bottomParts(),
    );
  }
  Container bottomParts() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.05),
            ),
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 55,
              width: 70,
              decoration: BoxDecoration(
                color: redLight,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset("images/cart_icon.svg"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                
                height: 65,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "BUY NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}