import 'package:flutter/cupertino.dart';

class CategoryEntity {
  final IconData icon;
  final String name;
  bool selected;

  CategoryEntity(
      {required this.selected, required this.icon, required this.name});
}
