import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/home_store_entity.dart';

class GetHomeStore {
  final HomeRepository homeRepository;

  GetHomeStore(this.homeRepository);

  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStore() {
    return homeRepository.getHomestore();
  }

  Future<Either<Failure, List<BestSellerEntity>>> getBestSeller() {
    return homeRepository.getBestSeller();
  }
}
