import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/repositories/product_detail_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_detail_entity.dart';

class GetProductDetail {
  final ProductDetailRepository productDetailRepository;

  GetProductDetail(this.productDetailRepository);

  Future<Either<Failure, List<ProductDetailEntity>>> getProductDetail() async {
    return productDetailRepository.getProductDetail();
  }
}
