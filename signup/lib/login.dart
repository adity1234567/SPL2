import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}) ;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
       
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF3DBCF),
                Color(0xFFFC9BBC8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.2),
              Text(
                'Enter your username\n and password..',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.01),
              Image.asset(
                'assets/images/asl3.png',
                width: 250,
                height: 250,
                fit: BoxFit.fill,
              ),
              SizedBox(height: size.height * 0.025),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          contentPadding: EdgeInsets.symmetric(horizontal: 22),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),

                      
                    ),
                    SizedBox(height: size.height * 0.02),
                   Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Password..',
                          contentPadding: EdgeInsets.symmetric(horizontal: 22),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                   ),
                    SizedBox(height: size.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                        
                         child: Text('Enter'),
                          ),
                        
                         
                        ),
                      ),
              ]  )
                  
                ),
             ] ),
            
          ),
        ),
      );
  
  }
}
// TODO Implement this library.