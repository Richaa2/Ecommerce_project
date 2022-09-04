import 'dart:developer';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          List<HomeStoreEntity> homePageStoreElement = [];
          List<BestSellerEntity> homePageBestElement = [];

          if (state is MainInitial) {
            BlocProvider.of<MainBloc>(context, listen: false).add(LoadEvent());
          }
          if (state is MainLoadedState) {
            homePageStoreElement = state.homeStore;
            homePageBestElement = state.bestSeller;

            return Row(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: homePageBestElement.length,
                      itemBuilder: ((context, index) {
                        return Text(homePageBestElement[index].id.toString());
                      })),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: homePageStoreElement.length,
                      itemBuilder: ((context, index) {
                        return Text(homePageStoreElement[index].id.toString());
                      })),
                ),
              ],
            );
          }
          return Container();
        });
      },
    );
  }
}
