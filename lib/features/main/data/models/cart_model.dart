import 'package:ecommerce_project/features/main/data/models/basket_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/my_cart_entity.dart';

@JsonSerializable()
class CartModel extends MyCartEntity {
  CartModel({
    required delivery,
    required basket,
    required id,
    required total,
  }) : super(
          delivery: delivery,
          basket: basket,
          id: id,
          total: total,
        );
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      basket: (json['basket'] as List<dynamic>)
          .map((e) => BasketModel.fromJson(e as Map<String, dynamic>)),
      delivery: json['delivery'],
      total: json['total'],
    );
  }
}
