import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() =>_ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 Container(
                   width: 150,
              child:const CircleAvatar(
                radius:60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/pictures/image.png'),
              ),

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black.withOpacity(.5),
                  width: 5.0,
                )
              ),
                 ),
              const SizedBox(height: 10,),
               SizedBox(
                width:size.width*.3,
                child: Row(children: [
                  Text('Adity Khisa', style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
                 
                ],),
               ),
                Text('aditykhisa@gmail.com',style:TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ))
            ],
          )
        ),
      )

    );
  }
}
