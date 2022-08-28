import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';

import 'package:flutter/material.dart';

class HotSalesList extends StatelessWidget {
  final List<HomeStoreEntity> hotSales;
  const HotSalesList({Key? key, required this.hotSales}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    var widthScreen = screenSize.width;

    return Container(
      height: heightScreen / 4.1,
      child: ListView.builder(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hotSales.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: (93 / 100) * widthScreen,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(hotSales[index].picture),
                        fit: BoxFit.fitHeight),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      decoration: hotSales[index].isNew != false
                          ? const BoxDecoration(
                              shape: BoxShape.circle, color: orange)
                          : null,
                      child: hotSales[index].isNew != false
                          ? const Center(
                              child: Text(
                                'New',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SFProDisplay'),
                              ),
                            )
                          : const SizedBox(),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      hotSales[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SFProDisplay'),
                    ),
                    Text(
                      hotSales[index].subtitle,
                      style: const TextStyle(
                          color: white,
                          fontFamily: 'SFProDisplay',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: white,
                          fixedSize: Size((25 / 100) * widthScreen, 23)),
                      onPressed: () {},
                      child: const Text(
                        'Buy now!',
                        style: TextStyle(
                            color: textColorblue,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SFProDisplay'),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
