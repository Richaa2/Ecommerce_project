import 'package:ecommerce_project/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryRoundButton extends StatelessWidget {
  bool selectedCategoty;
  final int index;
  List<IconData> icons = [
    Icons.phone_android_outlined,
    Icons.computer_outlined,
    Icons.health_and_safety_outlined,
    Icons.menu_book_outlined
  ];
  List<String> nameCategory = ['Phones', 'Computer', 'Health', 'Books'];
  CategoryRoundButton({
    Key? key,
    required this.index,
    this.selectedCategoty = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 23),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(167, 171, 201, 0.15),
                      offset: Offset(4, 5))
                ],
                shape: BoxShape.circle,
                color: selectedCategoty == true ? orange : Color(0xffFFFFFF),
              ),
              width: 71,
              child: IconButton(
                icon: index < icons.length
                    ? (Icon(
                        icons[index],
                        color: selectedCategoty == true
                            ? Color(0xffFFFFFF)
                            : Color(0xffB3B3C3),
                      ))
                    : Icon(Icons.error),
                onPressed: () {
                  selectedCategoty = true;
                },
              ),
            ),
          ),
          Text(
            index < icons.length ? nameCategory[index] : '',
            style: TextStyle(
                color: textColorblue,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
