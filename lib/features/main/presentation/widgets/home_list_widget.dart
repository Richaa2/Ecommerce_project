import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/core/error/failure.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            print(homePageStoreElement.length);
            print(homePageBestElement.length);
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
