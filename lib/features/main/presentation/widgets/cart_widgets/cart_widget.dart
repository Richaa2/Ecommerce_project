import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 45,
        ),
        itemCount: 2,
        itemBuilder: ((context, index) {
          return Row(
            children: [
              Container(
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textCart('Galaxy Note 20 Ultra', white),
                  textCart('\$3000', orange)
                ],
              )
            ],
          );
        }),
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
