import 'package:flutter/material.dart';

import 'features/main/domain/entities/category_entity.dart';

const Color textColorblue = Color(0xff010035);

const Color orange = Color(0xffFF6E4E);

const Color white = Color(0xffFFFFFF);

const List<String> items = ['Samsung', 'Huawei', 'Apple'];
String selectedItem = items[0];
const List<String> prices = [
  '\$1100 - \$1400',
  '\$800 - \$1100',
  '\$500 - \$800',
  '\$300 - \$500'
];
String selectedPrice = prices[0];
const List<String> size = [
  '4.5 to 5.5 inches',
  '5.5 to 6.5 inches',
  '6.5 to 7.5 inches',
  '7.5 to 8.5 inches'
];
String selectedSize = size[0];

List<CategoryEntity> categories = [
  CategoryEntity(
      icon: Icons.phone_android_outlined, name: 'Phones', selected: true),
  CategoryEntity(
      icon: Icons.computer_outlined, name: 'Computer', selected: false),
  CategoryEntity(
      icon: Icons.health_and_safety_outlined, name: 'Health', selected: false),
  CategoryEntity(
      icon: Icons.menu_book_outlined, name: 'Books', selected: false),
];
