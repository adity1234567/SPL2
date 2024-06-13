/*import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageAndMore extends StatefulWidget {
  const UploadImageAndMore({Key? key}) : super(key: key);

  @override
  State<UploadImageAndMore> createState() => _UploadImageAndMoreState();
}

class _UploadImageAndMoreState extends State<UploadImageAndMore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("Upload_Items");

  String imageUrl = '';

  Future<void> _create() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("Create your Items"),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'eg Elon',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  onPressed: () async {
                    final file =
                        await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (file == null) return;

                    String fileName =
                        DateTime.now().microsecondsSinceEpoch.toString();

                    Reference referenceRoot =
                        FirebaseStorage.instance.ref();
                    Reference referenceDireImages =
                        referenceRoot.child('images');

                    Reference referenceImageToUpload =
                        referenceDireImages.child(fileName);

                    try {
                      await referenceImageToUpload.putFile(File(file.path));

                      imageUrl =
                          await referenceImageToUpload.getDownloadURL();
                      setState(() {}); // Update the UI to reflect image upload
                    } catch (error) {
                      print("Error uploading image: $error");
                      // Handle error
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select and upload image"),
                        ),
                      );
                      return;
                    }
                    final String name = _nameController.text;
                    final int? number = int.tryParse(_numberController.text);
                    if (number != null) {
                      await _items.add({
                        "name": name,
                        "number": number,
                        "image": imageUrl,
                      });
                      _nameController.text = '';
                      _numberController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('Upload_Items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload and display Items"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred: ${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Map<String, dynamic>> items = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> thisItem = items[index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200, // Adjust height as needed
                      child: thisItem.containsKey('image')
                          ? Image.network(
                              "${thisItem['image']}",
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${thisItem['name']}",
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _create,
        child: const Icon(Icons.add),
      ),
    );
  }
}*/


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageAndMore extends StatefulWidget {
  const UploadImageAndMore({Key? key}) : super(key: key);

  @override
  State<UploadImageAndMore> createState() => _UploadImageAndMoreState();
}

class _UploadImageAndMoreState extends State<UploadImageAndMore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("Upload_Items");

  String imageUrl = '';

  Future<void> _create() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("Create your Items"),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'eg Elon',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  onPressed: () async {
                    final file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (file == null) return;

                    String fileName =
                        DateTime.now().microsecondsSinceEpoch.toString();

                    Reference referenceRoot =
                        FirebaseStorage.instance.ref();
                    Reference referenceDireImages =
                        referenceRoot.child('images');

                    Reference referenceImageToUpload =
                        referenceDireImages.child(fileName);

                    try {
                      await referenceImageToUpload.putFile(File(file.path));

                      imageUrl =
                          await referenceImageToUpload.getDownloadURL();
                      setState(() {}); // Update the UI to reflect image upload
                    } catch (error) {
                      print("Error uploading image: $error");
                      // Handle error
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select and upload image"),
                        ),
                      );
                      return;
                    }
                    final String name = _nameController.text;
                    final int? number =
                        int.tryParse(_numberController.text);
                    if (number != null) {
                      await _items.add({
                        "name": name,
                        "number": number,
                        "image": imageUrl,
                      });
                      _nameController.text = '';
                      _numberController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deleteItem(String docId, String imageUrl) async {
    try {
      // Delete image from Firebase Storage
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      // Delete item document from Firestore
      await _items.doc(docId).delete();
    } catch (error) {
      print("Error deleting item: $error");
    }
  }

  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream =
        FirebaseFirestore.instance.collection('Upload_Items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload and display Items"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred: ${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Map<String, dynamic>> items = snapshot.data!.docs
              .map((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
              .toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> thisItem = items[index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200, // Adjust height as needed
                      child: thisItem.containsKey('image')
                          ? Image.network(
                              "${thisItem['image']}",
                              fit: BoxFit.cover,
                            )
                          : const Placeholder(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${thisItem['name']}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Item'),
                            content: const Text(
                                'Are you sure you want to delete this item?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _deleteItem(thisItem['id'], thisItem['image']);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _create,
        child: const Icon(Icons.add),
      ),
    );
  }
}
