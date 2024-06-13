import 'package:flutter/material.dart';
import 'package:sign_language_tool/model/list.dart'; // Assuming you have imported your lessons list here
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Lesson {
  late String name;
  late bool isCompleted;

  Lesson({required this.name, this.isCompleted = false});

  static fromJson(lesson) {}
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count1 = 0;
  int _count = 0;
  late PageController _pageController = PageController();

  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImageUrls(); // Fetch image URLs when the widget initializes
    _pageController = PageController();
  }

  void fetchImageUrls() async {
    // Example: Fetching a list of images from a specific Firebase Storage directory
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('Module 1'); // Replace 'images' with your directory

    // List all items in the directory
    ListResult result = await ref.listAll();

    // Iterate through the items in the directory and fetch download URLs
    result.items.forEach((Reference ref) async {
      String downloadURL = await ref.getDownloadURL();
      setState(() {
        imageUrls.add(downloadURL); // Add each URL to the list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finished Lessons Tracker'),
        leading: IconButton(
          icon: Image.asset('assets/images/arrow2.gif', height: 50, width: 50),
          onPressed: () {
            Navigator.of(context).pop(_count1);
          },
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: lessons.length, // Assuming lessons is your list of Lesson objects
            itemBuilder: (context, index) {
              Lesson lesson = lessons[index];
              String imageUrl = index < imageUrls.length ? imageUrls[index] : ''; // Get imageUrl for current index
              return Center(
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: 300,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Alert'),
                                content: Text('Are you sure you have learned it?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        lesson.isCompleted = !lesson.isCompleted;
                                        _count1 = lessons.where((lesson) => lesson.isCompleted).length;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: CheckboxListTile(
                            title: Text(lesson.name),
                            value: lesson.isCompleted,
                            onChanged: null,
                          ),
                        ),
                        SizedBox(height: 10),
                        imageUrl.isNotEmpty
                            ? Image.network(
                                imageUrl,
                                width: 190,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : Container(), // Show empty container if imageUrl is empty
                      ],
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _count = index;
              });
            },
          ),
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2.5,
            child: Visibility(
              visible: _count > 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  if (_count > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2.5,
            child: Visibility(
              visible: _count < lessons.length - 1,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if (_count < lessons.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Finished Lessons: $_count1',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
