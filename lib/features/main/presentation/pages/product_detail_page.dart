import 'package:ecommerce_project/features/main/presentation/widgets/product_detail_widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductDetailAppBar(),
              Text('Photo'),
              Text('Detail'),
            ],
          ),
        ),
      ),
    );
  }
}
