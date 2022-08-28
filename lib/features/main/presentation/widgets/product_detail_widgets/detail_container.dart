import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'details_widget.dart';

class DetailContainer extends StatelessWidget {
  final ProductDetailEntity productDetailEntity;
  const DetailContainer({Key? key, required this.productDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Details(
        productDetailEntity: productDetailEntity,
      ),
    );
  }
}
