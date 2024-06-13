import 'package:flutter/foundation.dart';


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
