import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:ecommerce_project/features/main/presentation/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatelessWidget {
  final ProductDetailEntity productDetailEntity;
  Details({Key? key, required this.productDetailEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productDetailEntity.color.forEach((element) {
      element = element.toString().substring(1);
      print(element);
    });
    print(productDetailEntity.color);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productDetailEntity.title,
                style: const TextStyle(
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
                  productDetailEntity.isFavotite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: productDetailEntity.isFavotite ? orange : white,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              detail(Icons.memory_outlined, productDetailEntity.cpu),
              detail(Icons.camera_alt_outlined, productDetailEntity.camera),
              detail(Icons.sd_card_outlined, productDetailEntity.ssd),
              detail(FontAwesomeIcons.memory, productDetailEntity.sd),
            ],
          ),
          const Text(
            'Select color and capacity',
            style: TextStyle(
                color: textColorblue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                colorButton(true),
                colorButton(false),
                const SizedBox(
                  width: 20,
                ),
                capacityContainer(true),
                capacityContainer(false)
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage())),
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                  color: orange, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  whiteBoldText('Add to Cart', 20),
                  whiteBoldText('\$${productDetailEntity.price}', 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Text whiteBoldText(String text, double size) {
    return Text(
      text,
      style:
          TextStyle(color: white, fontWeight: FontWeight.w700, fontSize: size),
    );
  }

  Padding capacityContainer(bool less) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 72,
        height: 30,
        decoration: BoxDecoration(
            color: less ? orange : white,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          productDetailEntity.capacity[less ? 0 : 1] + ' GB',
          style: TextStyle(
              fontSize: 13,
              color: less ? white : const Color(0xff8D8D8D),
              fontWeight: FontWeight.w700),
        )),
      ),
    );
  }

  Padding colorButton(bool brownOrBlue) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(
            int.parse(
              '0xff' +
                  productDetailEntity.color[brownOrBlue ? 0 : 1]
                      .toString()
                      .substring(1),
            ),
          ),
        ),
        child: brownOrBlue
            ? const Icon(
                Icons.check,
                color: Color(0xffFAFAFA),
                size: 20,
              )
            : null,
      ),
    );
  }

  Padding detail(IconData icon, String name) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 29),
      child: Column(
        children: [
          FaIcon(
            icon,
            size: 28,
            color: const Color(0xffB7B7B7),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                color: const Color(0xffB7B7B7),
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Padding pageDetailsText(String name, bool currentPage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 33),
      child: Container(
        padding: const EdgeInsets.only(
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
            color: currentPage
                ? textColorblue
                : const Color(0xff000000).withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Padding star() {
    return const Padding(
      padding: EdgeInsets.only(left: 9, top: 8, bottom: 32),
      child: const Icon(
        Icons.grade,
        color: Color(0xffFFB800),
        size: 18,
      ),
    );
  }
}
