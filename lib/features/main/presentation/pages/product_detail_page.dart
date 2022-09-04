import 'dart:developer';

import 'package:ecommerce_project/features/main/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/product_detail_widgets/app_bar_widget.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/product_detail_widgets/detail_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_detail_widgets/list_details.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            log(state.toString());
          },
          builder: (context, state) {
            if (state is ProductInitialState) {
              BlocProvider.of<ProductBloc>(context, listen: false)
                  .add(LoadProductEvent());
            }
            if (state is ProduntLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProductDetailAppBar(
                      icon: Icons.shopping_bag_outlined,
                      name: 'Product Details',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 350,
                        child: ListViewDetails(
                          productDetailEntity: state.productDetail,
                        ),
                      ),
                    ),
                    DetailContainer(
                      productDetailEntity: state.productDetail,
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
