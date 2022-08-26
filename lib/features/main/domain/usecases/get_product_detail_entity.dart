import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_detail_entity.dart';

class GetProductDetail {
  final HomeRepository productDetailRepository;

  GetProductDetail(this.productDetailRepository);

  Future<Either<Failure, ProductDetailEntity>> call() async {
    return await productDetailRepository.getProductDetail();
  }
}
