import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/cart_widgets/cart_container.dart';
import '../widgets/product_detail_widgets/app_bar_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: ProductDetailAppBar(
                  icon: Icons.location_on_outlined,
                  name: 'add adress',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  'My Cart',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                ),
              ),
              CartContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
