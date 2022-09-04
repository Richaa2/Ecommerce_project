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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'images': images});
    result.addAll({'price': price});
    result.addAll({'title': title});

    return result;
  }

  factory BasketEntity.fromMap(Map<String, dynamic> map) {
    return BasketEntity(
      id: map['id'] ?? '',
      images: map['images'] ?? '',
      price: map['price']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BasketEntity.fromJson(String source) =>
      BasketEntity.fromMap(json.decode(source));
}
