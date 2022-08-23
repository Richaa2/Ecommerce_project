import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/usecases/get_home_store.dart';

import '../../../../core/error/failure.dart';
import '../entities/my_cart_entity.dart';
import '../entities/product_detail_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStore();
  Future<Either<Failure, List<BestSellerEntity>>> getBestSeller();
  Future<Either<Failure, List<ProductDetailEntity>>> getProductDetail();
  Future<Either<Failure, List<MyCartEntity>>> getMyCart();
}
