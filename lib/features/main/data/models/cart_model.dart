import 'package:ecommerce_project/features/main/data/models/basket_model.dart';

import '../../domain/entities/my_cart_entity.dart';

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
      id: json['id'] as String,
      basket: json['basket'] != null
          ? BasketModel.fromJson(json['basket']) as List
          : null,
      delivery: json['delivery'] as String,
      total: json['total'] as int,
    );
  }
}
