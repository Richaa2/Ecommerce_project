import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyCartEntity extends Equatable {
  final List<BasketEntity> basket;
  final String delivery;
  final String id;
  final int total;

  MyCartEntity(
      {required this.basket,
      required this.delivery,
      required this.id,
      required this.total});

  @override
  List<Object> get props => [basket, delivery, id, total];

  // factory MyCartEntity.fromJson(Map<String, dynamic> json) {
  //   return MyCartEntity(
  //     basket: List<BasketEntity>.from(json['basket']) as List<BasketEntity>,
  //     // basket: List<BasketEntity>.from(
  //     //     json['basket']?.map((x) => BasketEntity.fromMap(x))),
  //     delivery: json['delivery'] ?? '',
  //     id: json['id'] ?? '',
  //     total: json['total']?.toInt() ?? 0,
  //   );
  // }
}

class BasketEntity {
  final int id;
  final String images;
  final int price;
  final String title;

  BasketEntity(
      {required this.id,
      required this.images,
      required this.price,
      required this.title});

  factory BasketEntity.fromMap(Map<String, dynamic> map) {
    return BasketEntity(
      id: map['id'] ?? '',
      images: map['images'] ?? '',
      price: map['price']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  factory BasketEntity.fromJson(String source) =>
      BasketEntity.fromMap(json.decode(source));
}
