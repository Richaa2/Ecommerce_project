import 'package:ecommerce_project/features/main/domain/entities/product_detail_entity.dart';

class ProductDetailModel extends ProductDetailEntity {
  ProductDetailModel(
      {required cpu,
      required camera,
      required capacity,
      required color,
      required id,
      required images,
      required isFavorites,
      required price,
      required rating,
      required sd,
      required ssd,
      required title})
      : super(
            cpu: cpu,
            camera: camera,
            capacity: capacity,
            color: color,
            id: id,
            images: images,
            isFavotite: isFavorites,
            price: price,
            rating: rating,
            sd: sd,
            ssd: ssd,
            title: title);
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      cpu: json['CPU'] as String,
      camera: json['camera'] as String,
      capacity: json['capacity'] as List<dynamic>,
      color: json['color'] as List<dynamic>,
      id: json['id'] as String,
      images: json['images'] as List<dynamic>,
      isFavorites: json['isFavorites'] as bool,
      price: json['price'] as int,
      rating: json['rating'] as double,
      sd: json['sd'] as String,
      ssd: json['ssd'] as String,
      title: json['title'] as String,
    );
  }
}
