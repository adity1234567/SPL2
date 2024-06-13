
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
  int _count = 0;
  

  @override
  Widget build(BuildContext context) {
     double percent = (_count / widget.item.totalLesson) * 1;
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: GestureDetector(
          
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()))
                .then((count) {
              setState(() {
                _count = count ?? 0;
              });
            });
          },
         /* child: Container(
            height: 90,
            child: ListTile(
              
              tileColor: Colors.red,
              title: Text(widget.item.name),
              subtitle: Text("${widget.item.totalLesson}"),
              leading: SizedBox(
                 height: 130,
                  width: 70,
                child: Container(
                  
                  height: 130,
                  // Set a fixed width for the leading widget
                 // padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  */
      
                  //                                              CORRECT CODE CHILO.....
              /*   child: Card(
                    child: Container(
                       height: 130,
      
                        color: Colors.red[100],
                      child: ListTile(
                       //  contentPadding: EdgeInsets.only(bottom: 1),
                       //  contentPadding: EdgeInsets.symmetric(vertical: 15), 
                         
                                title: Text(widget.item.name),
                              
                                subtitle: Text("${widget.item.totalLesson}"),
                                 
                            leading: Container(
                                   height: 100,
                                  width: 130,
                                //  padding: const EdgeInsets.only(vertical:10),
                                  
                       child: 
                          Container(
                           // height: 100,
                           height: 100,
                            width: 60,
                            color: Colors.red,
                            child: CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 5,
                              percent: 0.5, // Example percentage
                              progressColor: Colors.blue,
                              backgroundColor: Colors.grey,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text(
                                '50%', // Example text
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        
                      ),
                                    ),
                                  ),
                    )
      
                  
        ));    
        }
      }
      **/
      
       child:Card(
       // padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Container(
          padding: EdgeInsets.all(40),
          height:160,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 60,
                    child: Stack(
                      children: [
                        CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 8,
                           percent: percent,
                        

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
                    width: 40,
                    
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                    height: 20,
                    
                  ),
                      Text(
                        //'something',
                        widget.item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _count.toString() +
                            '/' +
                            widget.item.totalLesson.toString(),
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
              
            ],
          ),
        ),
          ),
        **/]
          )
        
            )
       )
        )
      );
  }
 
  } 

/*import 'package:flutter/material.dart';
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
*/