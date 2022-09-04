import 'dart:developer';

import 'package:ecommerce_project/consts.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/pages/cart_page.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/first_page_widgets/best_sellers_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/first_page_widgets/category_list.dart';
import '../widgets/first_page_widgets/hot_sales_list.dart';
import '../widgets/first_page_widgets/location_widget.dart';
import '../widgets/first_page_widgets/search_widget.dart';
import '../widgets/first_page_widgets/view_all.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    var widthScreen = screenSize.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            log(state.toString());
          },
          builder: (context, state) {
            if (state is MainInitial) {
              BlocProvider.of<MainBloc>(context, listen: false)
                  .add(LoadEvent());
            }
            if (state is MainLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MainLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: heightScreen / 70,
                            horizontal: widthScreen / 30),
                        child: Column(
                          children: [
                            const LocationWidget(),
                            const ViewAll(
                                name: 'Select Category',
                                secondTitle: 'view all'),
                            const CategoryList(),
                            const SearchWidget(),
                            const ViewAll(name: 'Hot Sales'),
                            HotSalesList(hotSales: state.homeStore),
                            const ViewAll(name: 'Best Seller'),
                            BestSellersList(bestSeller: state.bestSeller),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 72,
                    decoration: BoxDecoration(
                        color: textColorblue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: white,
                            size: 15,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Explorer',
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => CartPage()))),
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: white,
                              size: 25,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: white,
                            size: 25,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Icon(
                            Icons.person_outline,
                            color: white,
                            size: 25,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ]),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
