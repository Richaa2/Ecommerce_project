import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyCartEntity extends Equatable {
  final List<dynamic> basket;
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

  // factory MyCartEntity.fromMap(Map<String, dynamic> map) {
  //   return MyCartEntity(
  //     basket: map['basket'],
  //     delivery: map['delivery'] ?? '',
  //     id: map['id'] ?? '',
  //     total: map['total']?.toInt() ?? 0,
  //   );
  // }

  // factory MyCartEntity.fromJson(String source) =>
  //     MyCartEntity.fromMap(json.decode(source));
}

class BasketEntity {
  final String id;
  final String images;
  final int price;
  final String title;

  BasketEntity(
      {required this.id,
      required this.images,
      required this.price,
      required this.title});

  // factory BasketEntity.fromJson(Map<String, dynamic> json) {
  //   return BasketEntity(
  //     id: json['id'],
  //     images: json['images'],
  //     price: json['price'],
  //     title: json['title'],
  //   );
  // }
}
