/*import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<Module> modules = [];
}

class Module {
  final String name;
  final List<SubModule> subModules;

  Module({required this.name, required this.subModules});

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      name: map['name'],
      subModules: List<SubModule>.from(map['subModules'].map((subModule) => SubModule.fromMap(subModule))),
    );
  }

  static fromJson(moduleJson) {}
}

class SubModule {
  final String name;
  final List<Item> lessons;

  SubModule({required this.name, required this.lessons});

  factory SubModule.fromMap(Map<String, dynamic> map) {
    return SubModule(
      name: map['name'],
      lessons: List<Item>.from(map['lessons'].map((lesson) => Item.fromMap(lesson))),
    );
  }
}

class Item {
  final String name;
  final int totalLesson;
  final String module;
  final String subModule;

  Item({required this.name, required this.totalLesson, required this.module, required this.subModule});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      totalLesson: map['totalLesson'],
      module: map['module'],
      subModule: map['subModule'],
    );
  }
}
*/

import 'package:flutter/foundation.dart';

// Define classes to represent your JSON structure
class Module {
  final String name;
  final List<SubModule> subModules;

  Module({required this.name, required this.subModules});

  factory Module.fromJson(Map<String, dynamic> json) {
    var subModulesList = json['subModules'] as List;
    List<SubModule> subModules =
        subModulesList.map((subModule) => SubModule.fromJson(subModule)).toList();

    return Module(
      name: json['name'],
      subModules: subModules,
    );
  }
}

class SubModule {
  final String name;
  final List<Lesson1> lessons;

  SubModule({required this.name, required this.lessons});

  factory SubModule.fromJson(Map<String, dynamic> json) {
    var lessonsList = json['lessons'] as List;
    List<Lesson1> lessons =
        lessonsList.map((lesson) => Lesson1.fromJson(lesson)).toList();

    return SubModule(
      name: json['name'],
      lessons: lessons,
    );
  }
}

class Lesson1 {
  final String name;
  final int totalLesson;

  Lesson1({required this.name, required this.totalLesson});

  factory Lesson1.fromJson(Map<String, dynamic> json) {
    return Lesson1(
      name: json['name'],
      totalLesson: json['totalLesson'],
    );
  }
}
