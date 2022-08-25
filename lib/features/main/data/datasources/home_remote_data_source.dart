import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/core/error/exception.dart';
import 'package:ecommerce_project/features/main/data/models/home_model.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/usecases/get_home_store.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<List<HomeStoreModel>> getHomeStore();
  Future<List<HomeBestSellerModel>> getBestSeller();

  // getProductDetail();
  // getMyCart();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  // Future<List<HomeStoreModel>> getHomeStore() async {
  //   final response = await client.get(
  //     Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
  //   );
  //   if (response.statusCode == 200) {
  //     final homeElement = jsonDecode(response.body);
  //     return (homeElement['home_store'] as List)
  //         .map((e) => HomeStoreModel.fromJson(e))
  //         .toList();
  //   } else {
  //     throw ServerException();
  //   }
  // }

  @override
  Future<List<HomeBestSellerModel>> getBestSeller() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
    );
    if (response.statusCode == 200) {
      final homeElement = jsonDecode(response.body);

      return (homeElement['best_seller'] as List)
          .map((e) => HomeBestSellerModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<HomeStoreModel>> getHomeStore() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
    );
    if (response.statusCode == 200) {
      final homeElement = jsonDecode(response.body);

      return (homeElement['home_store'] as List)
          .map((e) => HomeStoreModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  // @override
  // getMyCart() {
  //   // TODO: implement getMyCart
  //   throw UnimplementedError();
  // }

  // @override
  // getProductDetail() {
  //   // TODO: implement getProductDetail
  //   throw UnimplementedError();
  // }
}
