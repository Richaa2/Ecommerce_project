import 'dart:developer';

import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import '../widgets/cart_widgets/cart_container.dart';
import '../widgets/cart_widgets/cart_widget.dart';
import '../widgets/product_detail_widgets/app_bar_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            log(state.toString());
          },
          builder: (context, state) {
            if (state is CartInitialState) {
              BlocProvider.of<CartBloc>(context, listen: false)
                  .add(LoadCartEvent());
            }
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: ProductDetailAppBar(
                        icon: Icons.location_on_outlined,
                        name: 'Add adress',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Text(
                        'My Cart',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      height: 700,
                      decoration: BoxDecoration(
                        color: textColorblue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: CartWidget(myCart: state.myCart),
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
