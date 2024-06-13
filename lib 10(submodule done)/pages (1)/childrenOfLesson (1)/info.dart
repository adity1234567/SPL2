import 'package:sign_language_tool/model/catalog.dart';

final List<Item> subItems1 = [
  Item(name: "বাংলা সংখ্যা", totalLesson: 10),
  Item(name: "ইংরেজি সংখ্যা", totalLesson: 10),
];

final List<Item> subItems2 = [
  Item(name: "Mathematics", totalLesson: 12),
  Item(name: "Science", totalLesson: 15),
];



final Map<String, List<Item>> moduleItemsById = {
  '1': subItems1,
  '2': subItems2,
};