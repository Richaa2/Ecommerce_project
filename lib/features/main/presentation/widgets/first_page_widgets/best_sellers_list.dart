import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/product_detail_page.dart';

class BestSellersList extends StatelessWidget {
  final List<BestSellerEntity> bestSeller;
  const BestSellersList({Key? key, required this.bestSeller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120 * bestSeller.length.toDouble(),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bestSeller.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisSpacing: 14,
            mainAxisExtent: 227,
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductDetailPage())),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(170, 182, 211, 0.1),
                        offset: Offset(4, 5)),
                  ],
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image(
                        height: 200,
                        image: index == 0 || index == 2
                            ? NetworkImage(bestSeller[1].picture)
                            : NetworkImage(
                                bestSeller[index].picture,
                              ),
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          child: Icon(
                            index == 1 || index == 3
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: orange,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        '\$${bestSeller[index].priceWithoutDiscount}',
                        style: const TextStyle(
                            color: textColorblue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        '\$${bestSeller[index].discountPrice}',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xffCCCCCC),
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    bestSeller[index].title,
                    style: const TextStyle(
                        color: textColorblue,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
