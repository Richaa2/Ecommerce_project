import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:flutter/material.dart';

class ListViewDetails extends StatelessWidget {
  final ProductDetailEntity productDetailEntity;
  const ListViewDetails({
    Key? key,
    required this.productDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, PageViewIndex) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 270,
            child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(productDetailEntity.images[1]),
                        fit: BoxFit.cover))),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        height: 335,
      ),
    );
  }
}
