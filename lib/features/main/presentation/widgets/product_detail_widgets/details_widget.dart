import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatelessWidget {
  final ProductDetailEntity productDetailEntity;
  const Details({Key? key, required this.productDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 38),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productDetailEntity.title,
                style: TextStyle(
                    color: textColorblue,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                width: 37,
                height: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textColorblue),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: white,
                  size: 14,
                ),
              )
            ],
          ),
          Row(
            children: [
              star(),
              star(),
              star(),
              star(),
              star(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pageDetailsText('Shop', true),
              pageDetailsText('Details', false),
              pageDetailsText('Features', false)
            ],
          )
        ],
      ),
    );
  }

  Container pageDetailsText(String name, bool currentPage) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: currentPage ? orange : white,
        width: 3,
      ))),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: currentPage ? FontWeight.w700 : FontWeight.w400,
          color:
              currentPage ? textColorblue : Color(0xff000000).withOpacity(0.5),
        ),
      ),
    );
  }

  Padding star() {
    return Padding(
      padding: const EdgeInsets.only(left: 9, top: 8, bottom: 32),
      child: Icon(
        Icons.grade,
        color: Color(0xffFFB800),
        size: 18,
      ),
    );
  }
}
