import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // child: Center(child: Text('Camera'),),
     color:const Color.fromARGB(255, 231, 228, 228),
     child: Center(
      child: GestureDetector(
        onTap: (){},
        child: Container(
          height: 50,
          width:100,

          /**
           *  decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 86, 212, 189),
                                    ,
                                  ],
                                  //  stops: [0.2,0.4,0.5,0.6,0.8,1],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
           */
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                    color: Color.fromARGB(255, 91, 206, 98),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(4,4),
              ),
              BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                  blurRadius: 8,
                    offset: Offset(-4,-4),
              )
            ],
        
          ),
          child: const Center(child: Text("See All",
          style: TextStyle(color: Color.fromARGB(255, 83, 82, 82),fontWeight: FontWeight.bold,fontSize: 18),),),
        ),
      ),
     ),
     );
  }
}