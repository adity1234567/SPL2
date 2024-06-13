import 'package:flutter/material.dart';
import 'package:sign_language_tool/signup_pages/signupPage2.dart';
//import 'signup_page2.dart';

class SignupPage1 extends StatefulWidget {
    const SignupPage1({super.key, required Null Function(dynamic value) onNameChanged});
  @override
  State<SignupPage1> createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  final TextEditingController _nameController = TextEditingController();
 //final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
 //   _scrollController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffff3dbcf),
                Color(0xfffc9bbc8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.2),
              const Text(
                'What is your\n name?',
                style: TextStyle(
                  fontSize: 35,
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
              SizedBox(height: size.height * 0.075),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          contentPadding: EdgeInsets.symmetric(horizontal: 22),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: size.height * 0.1),
                  /*  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage2(
                              name: _nameController.text,
                            ),
                          ),
                        );
                      },
                      child: Text('Next'),
                    ),*/
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
