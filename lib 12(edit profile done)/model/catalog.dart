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


class CatalogModel{
  static List<Item>item=[];
}

class Item{
  final String name;
  final int totalLesson;

  Item({required this.name, required this.totalLesson});


  Item copyWith({ 
    required String name,
    required int totalLesson
  }) {
    return Item(
      
      name: name ?? this.name, 
      totalLesson:totalLesson ?? this.totalLesson
      
    );
  }

 /* Factory Item.fromMap(Map<String,dynamic>map)
  {
    Item(
      name:map['name'], 
      totalLesson:map["totalLesson"]
      );
  }*/
factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      
      name: map['name'],
      totalLesson:map["totalLesson"]
    );
  }
  toMap()=>{
    "name":name,
    "totalLesson":totalLesson,
  };
}
