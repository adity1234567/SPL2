/*import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_language_tool/model/catalog.dart';
import '../pages/childrenOfLesson/course_detail.dart';
//import 'package:profile/pages/childrenOfLesson/course_content.dart';
import '../constants.dart';
import '../model/model.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LessonPageState createState() => _LessonPageState();
}


class _LessonPageState extends State<LessonPage> {

 late final List<Module> modules;
   Future<List<Module>> loadModules() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final List<dynamic> jsonData = jsonDecode(jsonString)['modules'];
    return jsonData.map((moduleJson) => Module.fromJson(moduleJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Module>>(
        future: loadModules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No modules found'));
          } else {
            List<Module> modules = snapshot.data!;
          
            Scaffold(
      backgroundColor: Color(0xFFE8E8EA),
     // appBar: myAppBar(),
      body: SafeArea(
       // child:Stack()
        
       child: ListView(
  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          children: [
        /**  Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration:  BoxDecoration(
                color:Color(0xFFF70CC95),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
          child: Stack(
            children: [
              Positioned(
                top:35,
                left:340,
                child: ClipRRect(borderRadius: BorderRadius.circular(7),
                child: Container(
                  height: 40,
                  width: 40,
                  color:Color.fromRGBO(250, 250, 250, 0.1),
                  //child: Icon(),
                ),),)
            ],
          ),
            )
          ],
         ),
           
         
           Text(
              "Hey Alex,",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Find a course you want to learn",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            // for search bar
            searchBar(),
            **/
            const SizedBox(height: 25),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
            
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/Number.png'), // Replace 'assets/image.png' with your image path
                ),
                const Image(
                  width: 40,
                  height: 40,
                  image: AssetImage('assets/images/search.gif'))
              ],
            ),
            const SizedBox(height: 18,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
              "Hello, ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
               /* Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: primary,
                  ),
                ),
                */
              ],
            ),
            const SizedBox(height: 35),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //listview.builder --> scrollable
                  child: ListView.builder(
                      shrinkWrap: true,//just take how much space it actually needs..not more than that
                      itemCount: onlineCourceOne.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  imgDetail: onlineCourceOne[index]['img_detail'],
                                  title: onlineCourceOne[index]['title'],
                                  price: onlineCourceOne[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCourses(context, index),
                        );
                      }),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: onlineCourceTwo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  imgDetail: onlineCourceTwo[index]['img_detail'],
                                  title: onlineCourceTwo[index]['title'],
                                  price: onlineCourceTwo[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCoursesTwo(context, index),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding availableCourses(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
              color: Color(0xFFFEEF3EF), 
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceOne[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 140,
                  height: 140,
                ),
                SizedBox(height:10),
                Center(
                  child: Text(
                    onlineCourceOne[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
               
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
        
  }

  Padding availableCoursesTwo(BuildContext context, int index) {
    /**return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    onlineCourceTwo[index]['img'],
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onlineCourceTwo[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  onlineCourceTwo[index]['courses'],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    **/

     return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
              color: Color(0xFFFEEF3EF), 
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceTwo[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
              
                Center(
                  child: Text(
                    onlineCourceTwo[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for anything",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                )),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/burger_icon.svg",
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://www.simplilearn.com/ice9/free_resources_article_thumb/how_to_become_A_programmer.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
*/

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
import '../constants.dart';
import '../model/model.dart';
import '../pages/childrenOfLesson/course_detail.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late Future<List<Module>> _modulesFuture;

  @override
  void initState() {
    super.initState();
    _modulesFuture = loadModules();
  }

  Future<List<Module>> loadModules() async {
    final String jsonString = await rootBundle.loadString('assets/file/lesson.json');
    final List<dynamic> jsonData = jsonDecode(jsonString)['modules'];
    return jsonData.map((moduleJson) => Module.fromJson(moduleJson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Module>>(
      future: _modulesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No modules found'));
        } else {
         // List<Module> modules = snapshot.data!;
          List<Module> modules = snapshot.data as List<Module>;

          return Scaffold(
            backgroundColor: Color(0xFFE8E8EA),
            appBar: myAppBar(),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/images/Number.png'),
                      ),
                      Image(
                        width: 40,
                        height: 40,
                        image: AssetImage('assets/images/search.gif'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: onlineCourceOne.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoursesDetail(
                                      imgDetail: onlineCourceOne[index]['img_detail'],
                                      title: onlineCourceOne[index]['title'],
                                      price: onlineCourceOne[index]['price'],
                                       //List<Module> modules = snapshot.data as List<Module>;
                                     module: modules[index],
                                    ),
                                  ),
                                );
                              },
                              child: availableCourses(context, onlineCourceOne[index]),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: onlineCourceTwo.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoursesDetail(
                                      imgDetail: onlineCourceTwo[index]['img_detail'],
                                      title: onlineCourceTwo[index]['title'],
                                      price: onlineCourceTwo[index]['price'],
                                      module: modules[index],
                                    ),
                                  ),
                                );
                              },
                              child: availableCourses(context, onlineCourceTwo[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget availableCourses(BuildContext context, Map<String, dynamic> course) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width - 60 / 2,
        height: 220,
        decoration: BoxDecoration(
          color: Color(0xFFFEEF3EF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              course['img'],
              width: 140,
              height: 140,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                course['title'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search for anything",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.25),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/burger_icon.svg",
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://www.simplilearn.com/ice9/free_resources_article_thumb/how_to_become_A_programmer.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/


/*
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/info.dart';
import '../pages/childrenOfLesson/course_detail.dart';
//import 'package:profile/pages/childrenOfLesson/course_content.dart';
import '../constants.dart';
import '../model/model.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LessonPageState createState() => _LessonPageState();
}


class _LessonPageState extends State<LessonPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8EA),
     // appBar: myAppBar(),
      body: SafeArea(
       // child:Stack()
        
       child: ListView(
  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          children: [
        /**  Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration:  BoxDecoration(
                color:Color(0xFFF70CC95),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
          child: Stack(
            children: [
              Positioned(
                top:35,
                left:340,
                child: ClipRRect(borderRadius: BorderRadius.circular(7),
                child: Container(
                  height: 40,
                  width: 40,
                  color:Color.fromRGBO(250, 250, 250, 0.1),
                  //child: Icon(),
                ),),)
            ],
          ),
            )
          ],
         ),
           
         
           Text(
              "Hey Alex,",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Find a course you want to learn",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            // for search bar
            searchBar(),
            **/
            const SizedBox(height: 25),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
            
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/Number.png'), // Replace 'assets/image.png' with your image path
                ),
                Image(
                  width: 40,
                  height: 40,
                  image: AssetImage('assets/images/search.gif'))
              ],
            ),
            const SizedBox(height: 18,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
              "Hello, ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
               /* Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: primary,
                  ),
                ),
                */
              ],
            ),
            const SizedBox(height: 35),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //listview.builder --> scrollable
                  child: ListView.builder(
                      shrinkWrap: true,//just take how much space it actually needs..not more than that
                      itemCount: onlineCourceOne.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  id: onlineCourceOne[index]['id'],
                                  imgDetail: onlineCourceOne[index]['img_detail'],
                                  title: onlineCourceOne[index]['title'],
                                  price: onlineCourceOne[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCourses(context, index),
                        );
                      }),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: onlineCourceTwo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  id: onlineCourceTwo[index]['id'],
                                  imgDetail: onlineCourceTwo[index]['img_detail'],
                                  title: onlineCourceTwo[index]['title'],
                                  price: onlineCourceTwo[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCoursesTwo(context, index),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding availableCourses(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
              color: const Color(0xfffeef3ef), 
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceOne[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 140,
                  height: 140,
                ),
                const SizedBox(height:10),
                Center(
                  child: Text(
                    onlineCourceOne[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
               
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
        
  }

  Padding availableCoursesTwo(BuildContext context, int index) {
    /**return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    onlineCourceTwo[index]['img'],
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onlineCourceTwo[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  onlineCourceTwo[index]['courses'],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    **/

     return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
              color: const Color(0xfffeef3ef), 
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceTwo[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
              
                Center(
                  child: Text(
                    onlineCourceTwo[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for anything",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                )),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/burger_icon.svg",
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://www.simplilearn.com/ice9/free_resources_article_thumb/how_to_become_A_programmer.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
*/


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../pages/childrenOfLesson/course_detail.dart';
//import 'package:profile/pages/childrenOfLesson/course_content.dart';
import '../constants.dart';
import '../model/model.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LessonPageState createState() => _LessonPageState();
}


class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8EA),
     // appBar: myAppBar(),
      body: SafeArea(
       // child:Stack()
        
       child: ListView(
  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          children: [
        /**  Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration:  BoxDecoration(
                color:Color(0xFFF70CC95),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
          child: Stack(
            children: [
              Positioned(
                top:35,
                left:340,
                child: ClipRRect(borderRadius: BorderRadius.circular(7),
                child: Container(
                  height: 40,
                  width: 40,
                  color:Color.fromRGBO(250, 250, 250, 0.1),
                  //child: Icon(),
                ),),)
            ],
          ),
            )
          ],
         ),
           
         
           Text(
              "Hey Alex,",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Find a course you want to learn",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            // for search bar
            searchBar(),
            **/
            const SizedBox(height: 25),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
            
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/Number.png'), // Replace 'assets/image.png' with your image path
                ),
                const Image(
                  width: 40,
                  height: 40,
                  image: AssetImage('assets/images/search.gif'))
              ],
            ),
            const SizedBox(height: 18,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
              "Hello, ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
               /* Text(
                  "See All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: primary,
                  ),
                ),
                */
              ],
            ),
            const SizedBox(height: 35),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //listview.builder --> scrollable
                  child: ListView.builder(
                      shrinkWrap: true,//just take how much space it actually needs..not more than that
                      itemCount: onlineCourceOne.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  id: onlineCourceOne[index]['id'],
                                  imgDetail: onlineCourceOne[index]['img_detail'],
                                  title: onlineCourceOne[index]['title'],
                                  price: onlineCourceOne[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCourses(context, index),
                        );
                      }),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: onlineCourceTwo.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoursesDetail(
                                  id: onlineCourceTwo[index]['id'],
                                  imgDetail: onlineCourceTwo[index]['img_detail'],
                                  title: onlineCourceTwo[index]['title'],
                                  price: onlineCourceTwo[index]['price'],
                                ),
                              ),
                            );
                          },
                          child: availableCoursesTwo(context, index),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding availableCourses(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
               color: const Color(0xfffeef3ef),
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceOne[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 140,
                  height: 140,
                ),
                SizedBox(height:10),
                Center(
                  child: Text(
                    onlineCourceOne[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
               
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
        
  }

  Padding availableCoursesTwo(BuildContext context, int index) {
    /**return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    onlineCourceTwo[index]['img'],
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onlineCourceTwo[index]['title'],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  onlineCourceTwo[index]['courses'],
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    **/

     return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      //child: Stack(
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60 / 2,
            height: 220,
             
            decoration: BoxDecoration(
            color: const Color(0xfffeef3ef), 
             /*  image: DecorationImage(
                  image: AssetImage(
                    onlineCourceOne[index]['img'],
                  ),
                //  fit: BoxFit.cover
                ),
          
                 */
              borderRadius: BorderRadius.circular(20),
            ),

            child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onlineCourceTwo[index]['img'],
                //  'assets/image.png', // Replace 'assets/image.png' with your image path
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
              
                Center(
                  child: Text(
                    onlineCourceTwo[index]['title'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
              const SizedBox(height:20),
              ]
            ),

                
        

          ),
         
    /**       Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
           
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  //indicator
        **/          /** 
              Center(
                child: CircularPercentIndicator(
                  radius: 110,
                  lineWidth: 15,
                  percent: 0.4,
                  progressColor: Color(0xFFF7FD190),
                  backgroundColor: Color(0xFFE8E8EA),
                  circularStrokeCap: CircularStrokeCap.round,
                  center:Text('',style:TextStyle()),
                  ),
              ),
              
               **/
             

             
              ],
            ),
          );
  }

  Container searchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for anything",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                )),
          ),
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/burger_icon.svg",
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://www.simplilearn.com/ice9/free_resources_article_thumb/how_to_become_A_programmer.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}