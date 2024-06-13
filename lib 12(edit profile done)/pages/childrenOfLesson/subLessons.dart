/*import 'package:flutter/material.dart';
import 'package:sign_language_tool/model/list.dart';

class Lesson {
  late String name;
  late bool isCompleted;

  Lesson({required this.name, this.isCompleted = false});

  static fromJson(lesson) {}
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count1 = 0;
  int _count = 0;
  late PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finished lessonse Tracker'),
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
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              Lesson lesson = lessons[index];
              return Center(
                child: Card(
                  elevation: 4,
                  child: SizedBox(
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
                                title: const Text('Alert'),
                                content: const Text('Are you sure you have learned it?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        lesson.isCompleted = !lesson.isCompleted;
                                        _count1 = lessons.where((lesson) => lesson.isCompleted).length;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
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
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/images/how are you.gif',
                          width: 190,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
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
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  if (_count > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
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
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  if (_count < lessons.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
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
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Finished Lessons: $_count1',
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}


*/ import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Lesson {
  late String name;
  late bool isCompleted;
  late String imageUrlBangla; // URL for Bangla image
  late String imageUrlEnglish; // URL for English image

  Lesson({
    required this.name,
    this.isCompleted = false,
    this.imageUrlBangla = '',
    this.imageUrlEnglish = '',
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      name: json['name'],
      isCompleted: json['isCompleted'] ?? false,
      imageUrlBangla: '', // Initialize empty, will be set later
      imageUrlEnglish: '', // Initialize empty, will be set later
    );
  }
}

class HomePage extends StatefulWidget {
  final String id;
  final String name;
  const HomePage({Key? key, required this.id, required this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count1Bangla = 0; // Count for completed Bangla lessons
  int _count1English = 0; // Count for completed English lessons
  int _count = 0;
  late PageController _pageController;

  List<Lesson> banglaLessons = []; // List of Bangla lessons
  List<Lesson> englishLessons = []; // List of English lessons
  List<Lesson> lessons = []; // Currently displayed lessons

  bool isBanglaSelected = true; // Initially select Bangla submodule

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchImageUrls(); // Fetch image URLs when the widget initializes
  }

  void fetchImageUrls() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    if (widget.name == 'ইংরেজি') {
      isBanglaSelected = false;
    } else {
      isBanglaSelected = true;
    }

    String modulePath = isBanglaSelected ? 'Bangla_Num' : 'English_Num';

    // Fetch images based on selected submodule
    Reference ref = storage.ref().child('Module_${widget.id}/$modulePath');
    ListResult result = await ref.listAll();
    List<Lesson> fetchedLessons = [];
    for (var i = 0; i < result.items.length; i++) {
      String downloadURL = await result.items[i].getDownloadURL();
      fetchedLessons.add(Lesson(
        name: '${isBanglaSelected ? "Bangla" : "English"} Lesson ${i + 1}',
        imageUrlBangla: isBanglaSelected ? downloadURL : '',
        imageUrlEnglish: isBanglaSelected ? '' : downloadURL,
        isCompleted: (isBanglaSelected ? banglaLessons : englishLessons)
            .length > i
            ? (isBanglaSelected
                ? banglaLessons[i].isCompleted
                : englishLessons[i].isCompleted)
            : false,
      ));
    }

    setState(() {
      if (isBanglaSelected) {
        banglaLessons = fetchedLessons;
        lessons = banglaLessons;
        _count1Bangla = lessons.where((lesson) => lesson.isCompleted).length;
      } else {
        englishLessons = fetchedLessons;
        lessons = englishLessons;
        _count1English = lessons.where((lesson) => lesson.isCompleted).length;
      }
    });
  }

  void updateCompletedCount() {
    setState(() {
      if (isBanglaSelected) {
        _count1Bangla = lessons.where((lesson) => lesson.isCompleted).length;
      } else {
        _count1English = lessons.where((lesson) => lesson.isCompleted).length;
      }
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
            if (isBanglaSelected) {
              Navigator.of(context).pop(_count1Bangla);
            } else {
              Navigator.of(context).pop(_count1English);
            }
          },
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              Lesson lesson = lessons[index];

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
                                        updateCompletedCount();
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
                        if (isBanglaSelected && lesson.imageUrlBangla.isNotEmpty)
                          Image.network(
                            lesson.imageUrlBangla,
                            width: 190,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        if (!isBanglaSelected && lesson.imageUrlEnglish.isNotEmpty)
                          Image.network(
                            lesson.imageUrlEnglish,
                            width: 190,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
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
            'Finished Lessons: ${isBanglaSelected ? _count1Bangla : _count1English}',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}


/*


import 'package:flutter/material.dart';
import 'package:sign_language_tool/model/list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Lesson {
  late String name;
  late bool isCompleted;

  Lesson({required this.name, this.isCompleted = false});

  static fromJson(lesson) {}
}

class HomePage extends StatefulWidget {
  final String moduleName;
  final String subModuleName;

  const HomePage({Key? key, required this.moduleName, required this.subModuleName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count1 = 0;
  int _count = 0;
  late PageController _pageController;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchImageUrls(widget.moduleName, widget.subModuleName);
  }

  Future<void> fetchImageUrls(String moduleName, String subModuleName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(moduleName).child(subModuleName);

    ListResult result = await ref.listAll();
    List<String> urls = [];

    for (Reference item in result.items) {
      String downloadURL = await item.getDownloadURL();
      urls.add(downloadURL);
    }

    setState(() {
      imageUrls = urls;
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
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              Lesson lesson = lessons[index];
              String imageUrl = index < imageUrls.length ? imageUrls[index] : '';
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
                            : Container(),
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

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Lesson {
  late String name;
  late bool isCompleted;

  Lesson({required this.name, this.isCompleted = false});

  static fromJson(lesson) {}
}

class HomePage extends StatefulWidget {
  final String moduleName;
  final String subModuleName;

  const HomePage({Key? key, required this.moduleName, required this.subModuleName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count1 = 0;
  int _count = 0;
  late PageController _pageController;
  List<String> imageUrls = [];
  List<Lesson> lessons = []; // List to hold lessons

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchImageUrls(widget.moduleName, widget.subModuleName); // Fetch image URLs
    fetchLessons(widget.moduleName, widget.subModuleName); // Fetch lessons
  }

  Future<void> fetchImageUrls(String moduleName, String subModuleName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(moduleName).child(subModuleName);

    ListResult result = await ref.listAll();
    List<String> urls = [];

    for (Reference item in result.items) {
      String downloadURL = await item.getDownloadURL();
      urls.add(downloadURL);
    }

    setState(() {
      imageUrls = urls;
    });
  }

  void fetchLessons(String moduleName, String subModuleName) {
    // Replace with your logic to fetch lessons based on moduleName and subModuleName
    // Example: Assuming 'lessons' is a list of lessons related to moduleName and subModuleName
    setState(() {
      lessons = getLessonsForModuleAndSubmodule(moduleName, subModuleName);
    });
  }

  List<Lesson> getLessonsForModuleAndSubmodule(String moduleName, String subModuleName) {
    // Replace with your logic to filter lessons based on moduleName and subModuleName
    // Here's a mock implementation assuming 'lessons' contains all lessons
    return List.generate(
      10,
      (index) => Lesson(name: 'Lesson ${index + 1}'),
    );
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
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              Lesson lesson = lessons[index];
              String imageUrl = index < imageUrls.length ? imageUrls[index] : '';
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
                            : Container(),
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
*/