import 'package:ecommerce_project/consts.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(right: 23),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(
                      color: Color.fromRGBO(167, 171, 201, 0.15),
                      offset: Offset(4, 5))
                ],
                shape: BoxShape.circle,
                color:
                    selectedCategoty == true ? orange : const Color(0xffFFFFFF),
              ),
              width: 71,
              child: IconButton(
                icon: index < icons.length
                    ? (Icon(
                        icons[index],
                        color: selectedCategoty == true
                            ? const Color(0xffFFFFFF)
                            : const Color(0xffB3B3C3),
                      ))
                    : const Icon(Icons.error),
                onPressed: () {
                  selectedCategoty = true;
                },
              ),
            ),
          ),
          Text(
            index < icons.length ? nameCategory[index] : '',
            style: const TextStyle(
                color: textColorblue,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
