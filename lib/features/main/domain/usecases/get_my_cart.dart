import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/my_cart_entity.dart';

class GetMyCart {
  final HomeRepository cartRepository;

  GetMyCart(this.cartRepository);

  Future<Either<Failure, List<MyCartEntity>>> call() async {
    return await cartRepository.getMyCart();
  }
}
