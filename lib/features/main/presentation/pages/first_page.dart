import 'dart:developer';

import 'package:ecommerce_project/core/error/failure.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/hot_sales_list.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/location_widget.dart';
import 'package:ecommerce_project/features/main/presentation/widgets/view_all.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_page_entity.dart';
import '../../domain/usecases/get_home_store.dart';
import '../widgets/category_list.dart';
import '../widgets/home_list_widget.dart';
import '../widgets/search_widget.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    var widthScreen = screenSize.width;
    print(heightScreen);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            log(state.toString());
          },
          builder: (context, state) {
            List<HomeStoreEntity> homePageStoreElement = [];
            List<BestSellerEntity> homePageBestElement = [];
            if (state is MainInitial) {
              BlocProvider.of<MainBloc>(context, listen: false)
                  .add(LoadEvent());
            }

            if (state is MainLoadedState) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: heightScreen / 70, horizontal: widthScreen / 30),
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    LocationWidget(),
                    Spacer(
                      flex: 1,
                    ),
                    ViewAll(
                      name: 'Select Category',
                      secondTitle: 'view all',
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(flex: 2, child: CategoryList()),
                    Spacer(
                      flex: 1,
                    ),
                    SearchWidget(),
                    Spacer(
                      flex: 1,
                    ),
                    ViewAll(
                      name: 'Hot Sales',
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Flexible(
                        flex: 5,
                        child: HotSalesList(
                          bestSeller: state.homeStore,
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    ViewAll(
                      name: 'Best Seller',
                    ),
                    Spacer(
                      flex: 1,
                    ),
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
