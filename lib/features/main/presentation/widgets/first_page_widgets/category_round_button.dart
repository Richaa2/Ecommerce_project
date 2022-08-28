import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryRoundButton extends StatelessWidget {
  bool selectedCategoty;
  final int index;
  final void Function()? onPressed;
  List<CategoryEntity> categories;
  CategoryRoundButton({
    Key? key,
    required this.index,
    this.selectedCategoty = false,
    required this.onPressed,
    required this.categories,
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
                color: index < categories.length
                    ? categories[index].selected == true
                        ? orange
                        : white
                    : white,
              ),
              width: 71,
              child: IconButton(
                  icon: index < categories.length
                      ? (Icon(
                          categories[index].icon,
                          color: categories[index].selected == true
                              ? white
                              : const Color(0xffB3B3C3),
                        ))
                      : const Icon(Icons.error),
                  onPressed: onPressed),
            ),
          ),
          Text(
            index < categories.length ? categories[index].name : '',
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
