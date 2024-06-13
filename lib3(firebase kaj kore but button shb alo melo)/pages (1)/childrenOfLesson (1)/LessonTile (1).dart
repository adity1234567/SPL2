/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:profile/model/catalog.dart';
import 'package:profile/pages/childrenOfLesson/item_widget.dart';



class LessonTile extends StatefulWidget {
  const LessonTile({Key? key}) : super(key: key);

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final lessonJson =
          await rootBundle.loadString("assets/files/lesson.json");
      final decodedData = jsonDecode(lessonJson) as Map<String, dynamic>;
      final lessonData = decodedData["lessons1"];

      CatalogModel.item = (lessonData as List)
          .map((item) => Item.fromMap(item as Map<String, dynamic>))
          .toList();

      setState(() {});
    } catch (e) {
      print("Error loading lesson data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.item.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: CatalogModel.item.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: CatalogModel.item[index]);
                },
              ),
      ),
    );
  }
}




/**
 * child: GestureDetector(
         onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())).then((count) {
                  setState(() {
                    _count = count ?? 0;
                  });
                });
         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
        },

        child: Column(
          children: [
          ListView.builder(
        //  itemCount: lessons.length,
           itemCount: CatalogModel.items.length,
         itemBuilder: (context,index){
           return ItemWidget(
                 item:CatalogModel.items[index], 
          );
        
        
        
          
         },
        ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              
              child:
            Row(
              
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                       
                        height: 60,
                        width: 60,
                        child: Stack(
                          children: [
                            CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 5,
                               // double percent = $count * 10 / widget.totalLesson;
                            //    percent:_count * 10 /  5,
                              progressColor: Color(0xFFF7FD190),
                              backgroundColor: Color(0xFFE8E8EA),
                              circularStrokeCap: CircularStrokeCap.round,
                              // center:Text('',style:TextStyle()),
                            ),
                            Center(
                              child: Text(''),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'something',
                         // lessons[index][0],
                           // name,
                        //    lessonList
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$_count' +
                                '/' +
                                 totalLessons.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 /* IconButton(
                    icon: Icon(Icons.arrow_right_alt_sharp),
                    onPressed: () {
                       
                    },
                  )
                  **/
                  /** 
                ],
              ),
            ),
          ],
        ),
      ),
        );
  
  }
}
**/
**/




*/









import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/item_widget.dart';

class LessonTile extends StatefulWidget {
  const LessonTile({Key? key}) : super(key: key);

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  @override
  void initState() {
    super.initState();
    loadData(); // Load data when the widget is initialized
  }

  Future<void> loadData() async {
    try {
      final lessonJson = await rootBundle.loadString("assets/files/lesson.json");
      final decodedData = jsonDecode(lessonJson) as Map<String, dynamic>;
      final lessonData = decodedData["lessons1"];

      CatalogModel.item = (lessonData as List)
          .map((item) => Item.fromMap(item as Map<String, dynamic>))
          .toList();

      setState(() {}); // Update the state after loading data
    } catch (e) {
      print("Error loading lesson data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatalogModel.item.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: CatalogModel.item.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: CatalogModel.item[index]); // Display each item using ItemWidget
                },
              ),
      ),
    );
  }
}
