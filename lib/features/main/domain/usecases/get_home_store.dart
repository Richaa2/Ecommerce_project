import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/core/usecases/usecase.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';
import 'package:ecommerce_project/features/main/domain/usecases/get_my_cart.dart';

import '../../../../core/error/failure.dart';

class GetHomeStore {
  final HomeRepository homeRepository;

  GetHomeStore({required this.homeRepository});

  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStore() async {
    return await homeRepository.getHomeStore();
  }

  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers() async {
    return await homeRepository.getBestSeller();
  }

  // Future<Either<Failure, List<MyCartEntity>>> getMyCart() async {
  //   return await homeRepository.getMyCart();
  // }

  Future<Either<Failure, ProductDetailEntity>> getProductDetail() async {
    return await homeRepository.getProductDetail();
  }
}
