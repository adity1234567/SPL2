import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sign_language_tool/model/catalog.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/course_detail.dart';
import 'package:sign_language_tool/pages/childrenOfLesson/subLessons.dart'; // Adjust import as per your module structure

class ItemWidget extends StatelessWidget {
  final Module module;

  ItemWidget(this.module);

  int _count = 0; // Assuming this is where you track lesson progress

 @override
  Widget build(BuildContext context) {
    double progressPercent = _count / module.subModules.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ModuleDetails(module),
              ))
              .then((count) {
            if (count != null) {
              _count = count; // Update _count with returned value from ModuleDetails
            }
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
                  percent: progressPercent,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '${(progressPercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Module: ${module.name}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                     /* Text(
                        'SubModule: ${module.subModule}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        'Lessons: $_count / ${module.totalLesson}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
  /*
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
