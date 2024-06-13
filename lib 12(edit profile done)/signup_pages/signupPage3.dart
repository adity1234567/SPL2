import 'package:flutter/material.dart';

class SignupPage3 extends StatefulWidget {
  final String name;
  final String email;
  final Function(String) onPasswordChanged;

  const SignupPage3({
    super.key,
    required this.name,
    required this.email,
    required this.onPasswordChanged,
  });

  @override
  State<SignupPage3> createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  bool _isObscured = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffff3dbcf),
              Color(0xfffc9bbc8),
            ],
            end: Alignment.bottomLeft,
            begin: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Choose your\n  password',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                  'assets/images/asl4.png',
                  width: 350,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.7,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      hintText: 'Password..',
                      contentPadding: const EdgeInsets.all(22),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: _isObscured
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 20),
                    onChanged: widget.onPasswordChanged,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
