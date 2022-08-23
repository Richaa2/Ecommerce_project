import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable {
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  final bool isFavotite;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  ProductDetailEntity(
      this.cpu,
      this.camera,
      this.capacity,
      this.color,
      this.id,
      this.images,
      this.isFavotite,
      this.price,
      this.rating,
      this.sd,
      this.ssd,
      this.title);

  @override
  List<Object> get props {
    return [
      cpu,
      camera,
      capacity,
      color,
      id,
      images,
      isFavotite,
      price,
      rating,
      sd,
      ssd,
      title,
    ];
  }
}
