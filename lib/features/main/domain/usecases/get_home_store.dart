import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/core/usecases/usecase.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';

import '../../../../core/error/failure.dart';

class GetHomeStore {
  final HomeRepository homeRepository;

  GetHomeStore({required this.homeRepository});

  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStore() async {
    return await homeRepository.getHomeStore();
  }
}
