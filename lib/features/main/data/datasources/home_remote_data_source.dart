import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_project/core/error/exception.dart';
import 'package:ecommerce_project/features/main/data/models/home_model.dart';
import 'package:ecommerce_project/features/main/domain/usecases/get_home_store.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<List<HomeModel>> getHomeStore();
  // getProductDetail();
  // getMyCart();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeModel>> getHomeStore() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
    );
    if (response.statusCode == 200) {
      final homeElement = jsonDecode(response.body);
      return (homeElement['home_store'] as List)
          .map((e) => HomeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
