import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_home_store.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetUseCases getHomeStoreBloc;
  MainBloc({required this.getHomeStoreBloc}) : super(MainInitial()) {
    on<LoadEvent>((event, emit) async {
      emit(MainLoadingState());

      List<HomeStoreEntity> homeStoreElement = [];
      List<BestSellerEntity> homeBestElement = [];
      late MyCartEntity pageCartElement;
      late ProductDetailEntity productDetailElement;

      final failureOrHomeBest = await getHomeStoreBloc.getBestSellers();
      final failureOrHomeStore = await getHomeStoreBloc.getHomeStore();
      final failureOrCart = await getHomeStoreBloc.getMyCart();
      final failureOrProduct = await getHomeStoreBloc.getProductDetail();

      failureOrHomeBest.fold((failure) => MainErrorState(),
          (bestElement) => homeBestElement.addAll(bestElement));

      failureOrHomeStore.fold((failure) => MainErrorState(),
          (homeElement) => homeStoreElement.addAll(homeElement));

      failureOrCart.fold((failure) => MainErrorState(),
          (cartElement) => pageCartElement = cartElement);
      failureOrProduct.fold((failure) => MainErrorState(),
          (productElement) => productDetailElement = productElement);

      if (homeBestElement.isNotEmpty &&
          homeStoreElement.isNotEmpty &&
          productDetailElement != null &&
          pageCartElement != null) {
        emit(MainLoadedState(
          homeStore: homeStoreElement,
          bestSeller: homeBestElement,
          productDetail: productDetailElement,
          myCart: pageCartElement,
        ));
      }
    });
  }
}
