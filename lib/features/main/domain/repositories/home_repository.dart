import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';

import '../../../../core/error/failure.dart';
import '../entities/my_cart_entity.dart';
import '../entities/product_detail_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomePageEntity>>> getHomePage();
  Future<Either<Failure, List<ProductDetailEntity>>> getProductDetail();
  Future<Either<Failure, List<MyCartEntity>>> getMyCart();
}
