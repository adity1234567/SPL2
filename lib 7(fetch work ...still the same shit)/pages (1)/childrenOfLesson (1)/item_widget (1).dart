/*import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'; // Add this import
import 'package:tracker/model/catalog.dart';
import 'package:tracker/practice/2nd.dart';

class ItemWidget extends StatefulWidget {
  final Item item;
  const ItemWidget({super.key, required this.item}); // Fixed super.key

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
     // padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())).then((count) {
                  setState(() {
                    _count = count ?? 0;
                  });
                });
         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: ListTile(
          title: Text(widget.item.name),
          subtitle: Text("${widget.item.totalLesson}"),
          leading: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
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
                            progressColor: Color(0xFFF7FD190),
                            backgroundColor: Color(0xFFE8E8EA),
                            circularStrokeCap: CircularStrokeCap.round,
                            // You can add more properties here
                          ),
                          Center(
                            child: Text(''), // Placeholder text, you can put something here
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'; // Add this import
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/subLessons.dart';
//import 'package:tracker/model/catalog.dart';
//import 'package:tracker/practice/2nd.dart';

class ItemWidget extends StatefulWidget {
  final Item item;
  const ItemWidget({super.key, required this.item}); // Fixed super.key

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
     // padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())).then((count) {
                  setState(() {
                    _count = count ?? 0;
                  });
                });
         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: ListTile(
          title: Text(widget.item.name),
          subtitle: Text("${widget.item.totalLesson}"),
          leading: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
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
                            progressColor: Color(0xFFF7FD190),
                            backgroundColor: Color(0xFFE8E8EA),
                            circularStrokeCap: CircularStrokeCap.round,
                            // You can add more properties here
                          ),
                          Center(
                            child: Text(''), // Placeholder text, you can put something here
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/subLessons.dart'; // Ensure this points to the correct file
//import 'package:sign_language_tool/pages/homepage.dart'; // Ensure this points to the correct file

class ItemWidget extends StatefulWidget {
  final Item item;
  const ItemWidget({super.key, required this.item}); // Fixed super.key

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => HomePage(
                  moduleName: widget.item.module,
                  subModuleName: widget.item.subModule,
                ),
              ))
              .then((count) {
            setState(() {
              _count = count ?? 0;
            });
          });
        },
        child: ListTile(
          title: Text(widget.item.name),
          subtitle: Text("Lessons: ${ _count.toString()} / ${widget.item.totalLesson}"),
          leading: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
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
                            percent: widget.item.totalLesson > 0
                                ?   _count / widget.item.totalLesson
                                : 0,
                            progressColor: Colors.blue,
                            backgroundColor: Colors.grey,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                          Center(
                            child: Text(
                              '${(  _count / widget.item.totalLesson * 100).toStringAsFixed(1)}%',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

*/



import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/subLessons.dart';

class ItemWidget extends StatefulWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
       child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => HomePage(
                  moduleName: widget.item.module,
                  subModuleName: widget.item.subModule,
                ),
              ))
              .then((count) {
            setState(() {
              _count = count ?? 0;
            });
          });
        },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 60,
                lineWidth: 5,
                percent: 0, // Placeholder for progress
                progressColor: Colors.blue,
                backgroundColor: Colors.grey,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  '0%', // Placeholder for progress percentage
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Module: ${widget.item.module}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    'SubModule: ${widget.item.subModule}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    'Lessons: 0 / ${widget.item.totalLesson}', // Placeholder for lesson count
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}
