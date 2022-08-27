import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HotSalesList extends StatelessWidget {
  final List<HomeStoreEntity> bestSeller;
  const HotSalesList({Key? key, required this.bestSeller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    var widthScreen = screenSize.width;

    return ListView.builder(
      physics: PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: bestSeller.length,
      itemBuilder: (context, index) {
        print(bestSeller[index].picture);
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(bestSeller[index].picture),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              width: (93.5 / 100) * widthScreen,
            ),
          ],
        );
      },
    );
  }
}
