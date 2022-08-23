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
  Future<Either<Failure, List<HomePageEntity>>> getHomePage() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHomeElement = await remoteDataSource.getHomePage();

        return Right(remoteHomeElement);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MyCartEntity>>> getMyCart() {
    // TODO: implement getMyCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductDetailEntity>>> getProductDetail() {
    // TODO: implement getProductDetail
    throw UnimplementedError();
  }
}
