import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/model/list.dart';
import 'package:sign_language_tool/model/model.dart';
import 'package:sign_language_tool/constants.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/LessonTile.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';
//import 'model/model.dart';




class CourseContent extends StatefulWidget {
   final Size size;

  const CourseContent({
    super.key,
    required this.size,
  });

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.size.height * 0.4),
      height: widget.size.height ,
      width: widget.size.width,
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

                 
           ItemWidget(item:Item(name: "বাংলা সংখ্যা", totalLesson: 10)), 
           ItemWidget(item:Item(name: "ইংরেজি সংখ্যা", totalLesson: 10)),     
            // LessonTile(),
           

        /*    const Text(
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
            )*/
          ],
        ),
      ),
    );
  }
}


/*
class CourseContent extends StatefulWidget {
  final Size size;

  const CourseContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
   List<Lesson>? lessons;
  @override
  void initState() {
    super.initState();
    loadData(); // Load data when the widget is initialized
  }

  Future<void> loadData() async {
    try {
      final lessonJson = await rootBundle.loadString("assets/files/lesson.json");
    /*  final decodedData = jsonDecode(lessonJson) as Map<String, dynamic>;
      final lessonData = decodedData["lessons1"];

      CatalogModel.item = (lessonData as List)
          .map((item) => Item.fromMap(item as Map<String, dynamic>))
          .toList();

      setState(() {}); */
       List<dynamic> jsonList = jsonDecode(jsonData);
    setState(() {
      // Map JSON data to Lesson objects
      lessons = jsonList.map((lesson) => Lesson.fromJson(lesson)).toList();
    });
    } catch (e) {
      print("Error loading lesson data: $e");
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.size.height * 0.4),
      height: widget.size.height,
      width: widget.size.width,
      decoration: BoxDecoration(
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
          /*  Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.item.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: CatalogModel.item.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: CatalogModel.item[index]); // Display each item using ItemWidget
                },
              ),
      ),*/
       if (lessons != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lessons!
                    .map((lesson) => Text(
                          '${lesson.name}: ${lesson.totalLesson} lessons',
                        )) // Example UI element
                    .toList(),
              ),
            //LessonTile(), // Ensure LessonTile is called here
          ],
        ),
      ),
    );
  }
}*/