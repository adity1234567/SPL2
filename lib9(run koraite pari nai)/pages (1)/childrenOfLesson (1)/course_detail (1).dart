import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/model/model.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/course_content.dart';
import 'package:sign_language_tool/constants.dart';
//import 'package:sign_language_tool/modules/module_items.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/info.dart'; // Import the module items map by ID

class CoursesDetail extends StatefulWidget {
  final String imgDetail;
  final String title;
  final String price;
  final String id;

  const CoursesDetail({
    Key? key,
    required this.imgDetail,
    required this.title,
    required this.price,
    required this.id,
  }) : super(key: key);

  @override
  _CoursesDetailState createState() => _CoursesDetailState();
}

class _CoursesDetailState extends State<CoursesDetail> {
  late String selectedCourseId;
  late List<Item> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedCourseId = widget.id;
    selectedItems = moduleItemsById[selectedCourseId]!;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image
                Container(
                  height: size.height * 0.55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgDetail),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                // Top bar with back button and more options
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ),
                ),

                // Course details
                Positioned(
                  top: size.height * 0.4,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Yellow tag
                      Container(
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: 30,
                        width: 100,
                      ),
                      const SizedBox(height: 15),

                      // Title
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // User icon and other details
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/user_icon.svg",
                          ),
                          const SizedBox(width: 25),
                          // Add more details here as needed
                        ],
                      ),
                    ],
                  ),
                ),

                // Dropdown button and course content
                Positioned(
                  top: size.height * 0.55 - 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: selectedCourseId,
                        items: onlineCourceOne.map((course) {
                          return DropdownMenuItem<String>(
                            value: course['id'],
                            child: Text(course['title']),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCourseId = newValue!;
                            selectedItems = moduleItemsById[selectedCourseId]!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CourseContent(size: size, items: selectedItems),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom sheet for buy options
      bottomSheet: bottomParts(),
    );
  }

  Widget bottomParts() {
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
        ],
      ),
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
              child: SvgPicture.asset("assets/images/cart_icon.svg"),
            ),
            const SizedBox(width: 20),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
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

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/LessonTile.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';
import '../../pages/ChildrenOfLesson/course_content.dart';
import 'package:sign_language_tool/constants.dart';

class CoursesDetail extends StatefulWidget {
  final String imgDetail;
  final String title;
  final String price;
  final Module module;

  const CoursesDetail({
    Key? key,
    required this.imgDetail,
    required this.title,
    required this.price,
    required this.module,
  }) : super(key: key);

  @override
  State<CoursesDetail> createState() => _CoursesDetailState();
}

class _CoursesDetailState extends State<CoursesDetail> {
  late final List<Module> modules = []; // Initialize with your list of modules

  @override
  void initState() {
    super.initState();
    // Initialize modules here with actual data from your application
    modules.addAll(widget.module.subModules as Iterable<Module>); // Assuming module has subModules
  }

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
                    height: size.height * 0.55,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imgDetail),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                    // Display list of modules
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: modules.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(modules[index].name),
                          onTap: () {
                            // Navigate to module details page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemWidget(modules[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    // Additional content like CourseContent can follow here
                    CourseContent(
                      size: size,
                      title: widget.title,
                     // widget.module,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: bottomParts(),
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
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
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
              child: SvgPicture.asset("assets/images/cart_icon.svg"),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
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



class ModuleDetails extends StatelessWidget {
  final Module module;

  ModuleDetails(this.module);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module.name),
      ),
      body: ListView.builder(
        itemCount: module.subModules.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(module.subModules[index].name),
            children: module.subModules[index].lessons.map((lesson) {
              return ListTile(
                title: Text(lesson.name),
                subtitle: Text('Total Lessons: ${lesson.totalLesson}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
*/