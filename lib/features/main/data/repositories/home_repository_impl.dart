import 'package:ecommerce_project/core/platform/network_info.dart';
import 'package:ecommerce_project/features/main/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStore() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHomeElement = await remoteDataSource.getHomeStore();

        return Right(remoteHomeElement);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestSeller() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHomeElement = await remoteDataSource.getBestSeller();

        return Right(remoteHomeElement);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MyCartEntity>> getMyCart() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCartElement = await remoteDataSource.getMyCart();

        return Right(remoteCartElement);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDetailEntity>> getProductDetail() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductElement = await remoteDataSource.getProductDetail();

        return Right(remoteProductElement);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
