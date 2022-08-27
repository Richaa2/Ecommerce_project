import 'dart:convert';

import 'package:ecommerce_project/core/error/exception.dart';
import 'package:ecommerce_project/features/main/data/models/cart_model.dart';
import 'package:ecommerce_project/features/main/data/models/home_model.dart';
import 'package:ecommerce_project/features/main/data/models/product_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  Future<List<HomeStoreModel>> getHomeStore();
  Future<List<HomeBestSellerModel>> getBestSeller();

  Future<ProductDetailModel> getProductDetail();
  Future<CartModel> getMyCart();
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

  @override
  Future<ProductDetailModel> getProductDetail() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'),
    );

    if (response.statusCode == 200) {
      final productElementRemote =
          jsonDecode(response.body) as Map<String, dynamic>;
      try {
        //so bad json
        final cpu = productElementRemote["CPU"] as String;
        final camera = productElementRemote["camera"] as String;
        final capacity = productElementRemote["capacity"] as List<dynamic>;
        final color = productElementRemote["color"] as List<dynamic>;
        final id = productElementRemote["id"] as String;
        final images = productElementRemote["images"] as List<dynamic>;
        final isFavorites = productElementRemote["isFavorites"] as bool;
        final price = productElementRemote["price"] as int;
        final rating = productElementRemote["rating"] as double;
        final sd = productElementRemote["sd"] as String;
        final ssd = productElementRemote["ssd"] as String;
        final title = productElementRemote["title"] as String;

        return ProductDetailModel(
          cpu: cpu,
          camera: camera,
          capacity: capacity,
          color: color,
          id: id,
          images: images,
          isFavorites: isFavorites,
          price: price,
          rating: rating,
          sd: sd,
          ssd: ssd,
          title: title,
        );
      } catch (e) {
        throw (e);
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartModel> getMyCart() async {
    final response = await client.get(
      Uri.parse('https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'),
    );
    if (response.statusCode == 200) {
      final cartElement = jsonDecode(response.body);

      try {
        final basket = cartElement["basket"];
        final delivery = cartElement["delivery"] as String;
        final id = cartElement["id"] as String;
        final total = cartElement["total"] as int;
        return CartModel(
            delivery: delivery, basket: basket, id: id, total: total);
      } catch (e) {
        throw (e);
      }
    } else {
      throw ServerException();
    }
  }
}
