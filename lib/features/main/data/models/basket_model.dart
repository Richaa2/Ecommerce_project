import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({required id, required images, required price, required title})
      : super(
          id: id,
          images: images,
          price: price,
          title: title,
        );

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      id: json['name'],
      images: json['images'],
      price: json['price'],
      title: json['title'],
    );
  }
}
