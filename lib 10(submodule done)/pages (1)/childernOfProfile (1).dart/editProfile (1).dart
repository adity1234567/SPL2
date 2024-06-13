import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 241, 243, 0.9),
              ),
            ),
            // color: Color.fromRGBO(245, 241, 243, 0.9),
            leading: IconButton(
              icon: Image.asset('assets/images/arrow2.gif',
                  height: 50, width: 50),
              onPressed: () {
                Navigator.pop(context); // Using Navigator.pop to go back
              },
            ),
            title: const Center(
              child: Text(
                'APP NAME',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text('Save'),
                  )),
            ]),
       body: SafeArea(
         child: Column(
           children: <Widget>[
             Container(
               height: 200,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 241, 243, 0.9),
          borderRadius: BorderRadius.circular(15),
               ),
               child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            // Profile picture and "Select Picture" section
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/your_image.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              'No Image',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 16),
                  const Text(
                    'Select Picture',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
           ]
               )
             ),
               const SizedBox(height: 20),
          // Username and description text fields
            Container(
            
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'UserName',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ],
               ),
       ),
    );
  
}

    
              
}
