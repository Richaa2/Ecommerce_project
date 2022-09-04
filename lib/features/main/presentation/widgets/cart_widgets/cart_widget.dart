import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/presentation/pages/first_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartWidget extends StatelessWidget {
  final MyCartEntity myCart;

  CartWidget({
    Key? key,
    required this.myCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(myCart.basket[1].id);

    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 45,
              ),
              itemCount: myCart.basket.length,
              itemBuilder: ((context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 85,
                      height: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(myCart.basket[index].images),
                              fit: BoxFit.fitWidth),
                          borderRadius: BorderRadius.circular(10),
                          color: white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textCart(myCart.basket[index].title, white),
                        textCart('\$${myCart.basket[index].price}', orange)
                      ],
                    ),
                    controlContainer(),
                    const Icon(
                      Icons.delete_outline,
                      color: Color(0xff36364D),
                      size: 25,
                    ),
                  ],
                );
              }),
            ),
          ),
          Divider(
            height: 10,
            color: white.withOpacity(0.3),
            thickness: 1,
          ),
          textSum('Total', '\$${myCart.total} us'),
          textSum('Delivery', myCart.delivery),
          Divider(
            height: 10,
            color: white.withOpacity(0.2),
            thickness: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 20),
            child: GestureDetector(
              onTap: (() =>
                  Navigator.popUntil(context, (route) => route.isFirst)),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding textSum(String name, String nameSecond) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          Text(
            nameSecond,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  Container controlContainer() {
    return Container(
      width: 30,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xff282843),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.remove,
            color: white,
            size: 20,
          ),
          const Text(
            '1',
            style: const TextStyle(
                color: white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const Icon(
            Icons.add,
            color: white,
            size: 20,
          )
        ],
      ),
    );
  }

  SizedBox textCart(String name, Color color) {
    return SizedBox(
      width: 153,
      child: Text(
        name,
        style:
            TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
