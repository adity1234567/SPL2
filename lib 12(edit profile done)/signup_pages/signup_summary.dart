import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SummaryPage extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const SummaryPage({super.key, required this.name, required this.email, required this.password});

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          
          ElevatedButton(
              onPressed: () async {
                await Firebase.initializeApp();
                FirebaseFirestore firestore = FirebaseFirestore.instance;

                firestore.collection('users').add({
                  'name': widget.name,
                  'email': widget.email,
                  'password': widget.password,  // In a real app, hash the password before storing
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('User Added')),
                  );
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add user: $error')),
                  );
                });
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
