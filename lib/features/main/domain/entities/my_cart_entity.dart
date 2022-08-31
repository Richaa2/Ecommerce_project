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
}
