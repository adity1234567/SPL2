import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:profile/model/model.dart';
import 'package:profile/constants.dart';
//import 'model/model.dart';


class CourseContent extends StatelessWidget {
   final Size size;

  const CourseContent({
    super.key,
    required this.size,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.4),
      height: size.height ,
      width: size.width,
      decoration: const BoxDecoration(
      //  color: Colors.white,
       color: Color.fromRGBO(245, 241, 243, 0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Course Content",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: List.generate(course_content.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course_content[index]['id'],
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course_content[index]['duration'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            course_content[index]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: course_content[index]["isWatched"]
                              ? green
                              : green.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "images/play_icon.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}