import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/model/list.dart';
import 'package:sign_language_tool/model/model.dart';
import 'package:sign_language_tool/constants.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/LessonTile.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/info.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';
//import 'model/model.dart';




class CourseContent extends StatefulWidget {
   final Size size;
   final List<Item> items;

  const CourseContent({
    super.key,
    required this.size, required this.items,
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
       //   children:buildItemWidgets(widget.items),
        children: widget.items.map((item) => ItemWidget(item: item)).toList(),

               // info(ItemWidget(item: Item(name: name, totalLesson: totalLesson),)),
//ItemWidget(item:Item(name: "বাংলা সংখ্যা", totalLesson: 10)), 
        //   ItemWidget(item:Item(name: "ইংরেজি সংখ্যা", totalLesson: 10)),     
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
































/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
//import 'package:sign_language_tool/model/catalog.dart';
//import 'package:sign_language_tool/model/list.dart';
//import 'package:sign_language_tool/model/model.dart';
//import 'package:sign_language_tool/constants.dart';
//
//import 'package:sign_language_tool/pages/childrenOfLesson/LessonTile.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';
//import 'model/model.dart';




class CourseContent extends StatefulWidget {
   final Size size;

  const CourseContent(String title, {
    super.key,
    required this.size, required String title, required String title, required String title,
  });

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
 
  List<Item>? lessons;
    Map<String, dynamic>? decodedData;
  List<Module> modules = [];
  List<SubModule>? subModules;
  String selectedModuleName = ""; 

  @override
  void initState() {
    super.initState();
    loadData(); // Load data when the widget is initialized
  }

  Future<void> loadData() async {
    try {
      final lessonJson = await rootBundle.loadString("assets/file/lesson.json");
     // final List<dynamic> decodedData = jsonDecode(lessonJson);
   decodedData = jsonDecode(lessonJson);
//  final Map<String, dynamic> decodedData = jsonDecode(lessonJson);
      setState(() {
         modules = (decodedData!['modules'] as List)
          .map((moduleData) => Module.fromMap(moduleData))
          .toList();
       // lessons = decodedData.map((item) => Item.fromMap(item)).toList();
      });
    } catch (e) {
      print("Error loading lesson data: $e");
    }
  }
void selectModule(String moduleName) {
    setState(() {
      selectedModuleName = moduleName;
      // Filter and set sub-modules for the selected module
      subModules = modules
          .firstWhere((module) => module.name == selectedModuleName, orElse: () => Module(name: "", subModules: []))
          .subModules;
    });
  }
  
  /* final moduleData = decodedData['modules'].firstWhere((module) => module['name'] == moduleName, orElse: () => null);

      if (moduleData != null) {
        // Retrieve sub-modules for the specified module
        final List<dynamic> subModulesData = moduleData['subModules'];

        setState(() {
          subModules = subModulesData.map((subModuleData) => SubModule.fromMap(subModuleData)).toList();
        });
      } else {
        // Handle case where specified module is not found
        setState(() {
          subModules = []; // or handle with an appropriate error message or fallback
        });
      }
    } catch (e) {
      print("Error loading lesson data: $e");
      // Handle error loading data
    }
  }
  */
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.size.height * 0.4),
      height: widget.size.height,
      width: widget.size.width,
      decoration: const BoxDecoration(
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
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: modules.map((module) {
                return ElevatedButton(
                  onPressed: () => selectModule(module.name),
                  child: Text(module.name),
                );
              }).toList(),
            ),
            subModules == null
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: lessons!.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(item: lessons![index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
/*  @override
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
*/
*/
/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_language_tool/model/catalog.dart'; // Assuming your model classes are defined here

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
  List<Module> modules = [];
  List<SubModule>? subModules;
  String selectedModuleName = ""; // Track the selected module name

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final lessonJson = await rootBundle.loadString("assets/file/lesson.json");
      final Map<String, dynamic> decodedData = jsonDecode(lessonJson);

      // Initialize modules list from decodedData
      modules = (decodedData['modules'] as List)
          .map((moduleData) => Module.fromMap(moduleData))
          .toList();
    } catch (e) {
      print("Error loading lesson data: $e");
    }
  }

  void selectModule(String moduleName) {
    setState(() {
      selectedModuleName = moduleName;
      // Filter and set sub-modules for the selected module
      subModules = modules
          .firstWhere((module) => module.name == selectedModuleName, orElse: () => Module(name: "", subModules: []))
          .subModules;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.size.height * 0.4),
      height: widget.size.height,
      width: widget.size.width,
      decoration: const BoxDecoration(
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
            // Module Selection Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: modules.map((module) {
                return ElevatedButton(
                  onPressed: () => selectModule(module.name),
                  child: Text(module.name),
                );
              }).toList(),
            ),
            // Sub-Modules List
            subModules == null
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: subModules!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(subModules![index].name),
                          // You can customize ListTile as per your requirement
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart'; // Assuming your model classes are defined here

class CourseContent extends StatefulWidget {
  final String title;
  final Size size;

  const CourseContent({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  List<SubModule>? subModules;
  String selectedModuleName = ""; // Track the selected module name

  Future<List<Module>> loadModules() async {
    final String jsonString = await rootBundle.loadString('assets/file/lesson.json');
    final List<dynamic> jsonData = jsonDecode(jsonString)['modules'];
    return jsonData.map((moduleJson) => Module.fromJson(moduleJson)).toList();
  }

  void selectModule(String moduleName, List<Module> modules) {
    setState(() {
      selectedModuleName = moduleName;
      // Filter and set sub-modules for the selected module
      subModules = modules
          .firstWhere((module) => module.name == selectedModuleName, orElse: () => Module(name: "", subModules: []))
          .subModules;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Module>>(
        future: loadModules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No modules found'));
          } else {
            List<Module> modules = snapshot.data!;
            return Container(
              margin: EdgeInsets.only(top: widget.size.height * 0.4),
              height: widget.size.height,
              width: widget.size.width,
              decoration: const BoxDecoration(
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
                    // Module Selection Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: modules.map((module) {
                        return ElevatedButton(
                          onPressed: () => selectModule(module.name, modules),
                          child: Text(module.name),
                        );
                      }).toList(),
                    ),
                    // Sub-Modules List
                    subModules == null
                        ? Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView.builder(
                              itemCount: subModules!.length,
                              itemBuilder: (context, index) {
                                return ItemWidget(item: Lesson[index]); //ItemWidget(item: CatalogModel.itm[index]);
                                //ListTile(
                                  //title: Text(subModules![index].name),
                                
                                /*   
                                 
                                   */
                                  // You can customize ListTile as per your requirement
                                
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart'; // Assuming your model classes are defined here

class CourseContent extends StatefulWidget {
  final String title;
  final Size size;
  // final Module module;
   //final List<Module> modules;

  const CourseContent({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  List<SubModule>? subModules;
  String selectedModuleName = ""; // Track the selected module name

  Future<List<Module>> loadModules() async {
    final String jsonString = await rootBundle.loadString('assets/file/lesson.json');
    final List<dynamic> jsonData = jsonDecode(jsonString)['modules'];
    return jsonData.map<Module>((moduleJson) => Module.fromJson(moduleJson)).toList();
  }

  void selectModule(String moduleName, List<Module> modules) {
    setState(() {
      selectedModuleName = moduleName;
      // Filter and set sub-modules for the selected module
      subModules = modules
          .firstWhere((module) => module.name == selectedModuleName, orElse: () => Module(name: "", subModules: []))
          .subModules;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Module>>(
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
            return Container(
              margin: EdgeInsets.only(top: widget.size.height * 0.4),
              height: widget.size.height,
              width: widget.size.width,
              decoration: const BoxDecoration(
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
                    // Module Selection Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: modules.map((module) {
                        return ElevatedButton(
                          onPressed: () => selectModule(module.name, modules),
                          child: Text(module.name),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    // Sub-Modules List
                    subModules == null
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView.builder(
                              itemCount: subModules!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subModules![index].name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  /*  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: subModules![index].lessons.length,
                                      itemBuilder: (context, lessonIndex) {
                                        return ItemWidget(item: subModules![index].lessons[lessonIndex]);
                                      },
                                    ),*/
                                  ],
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
*/
