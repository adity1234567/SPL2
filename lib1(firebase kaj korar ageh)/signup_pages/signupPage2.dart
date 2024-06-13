/*import 'package:flutter/material.dart';

class SignupPage2 extends StatefulWidget {
  const SignupPage2({super.key});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     
        body:
         Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFFF3DBCF),
          Color(0xFFFC9BBC8),
        ], // Add your desired colors here
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
        child: Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: size.height * 0.5,
          width: size.width ,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            // color:Color(0xFFFC9BBCB),
          ),
          child: Center(
            child: Text(
              '     Type your\n email address',
              style: TextStyle(
                fontSize: 35, // adjust the font size as needed
                fontWeight: FontWeight.bold, // adjust font weight as needed
                color: Colors.black, // adjust color as needed
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: size.height * 0.33,
          left: 0,
          right: 0,
          child: Center(
             child: Image.asset(
              'assets/images/asl5.png', 
              width: 250, 
              height: 250,
              fit: BoxFit.fill,
            ),
          ) // Add your widget here
          ),


       Positioned(
          top: size.height * 0.7,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
      width: size.width * 0.8, // Adjust width as needed
      height: 60, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.grey[200], // Adjust color as needed
        borderRadius: BorderRadius.circular(20), // Adjust border radius as needed
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'email@example.com', // Hint text for the text field
          contentPadding: EdgeInsets.symmetric(horizontal: 22), // Adjust padding as needed
          border: InputBorder.none, // Remove border
        ),
        //textAlign: TextAlign.center, // Align text at the center
        style: TextStyle(fontSize: 20), // Adjust font size as needed
      ),
    ),
          ) // Add your widget here
          ),
      //SizedBox(height: 80,),
    ])));
  }
}
*/



import 'package:flutter/material.dart';
import 'package:sign_language_tool/signup_pages/signupPage3.dart';

class SignupPage2 extends StatefulWidget {
  final Function(String) onEmailChanged;
  const SignupPage2({super.key, required this.onEmailChanged,});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final ScrollController _scrollController = ScrollController();
final TextEditingController _emailController = TextEditingController();
  
  @override
  void dispose() {
    _scrollController.dispose();
     _emailController.dispose();
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
        child: SingleChildScrollView(
          controller: _scrollController,
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
                  '  Type your\nemail address',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.01),
                Image.asset(
                  'assets/images/asl5.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              SizedBox(height: size.height * 0.075),
                Container(
                  width: size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'email@example.com',
                      contentPadding: EdgeInsets.symmetric(horizontal: 22),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: size.height * 0.1),

               /* ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage3(
                              name: widget.name,
                              email: _emailController.text,
                            ),
                          ),
                        );
                      },
                      child: Text('Next'),
                    ),
                    */
              ],
            ),
          ),
        ),
      ),
    );
  }
}