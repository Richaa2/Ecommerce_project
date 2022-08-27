import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable {
  final String cpu;
  final String camera;
  final List<dynamic> capacity;
  final List<dynamic> color;
  final String id;
  final List<dynamic> images;
  final bool isFavotite;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  ProductDetailEntity(
      {required this.cpu,
      required this.camera,
      required this.capacity,
      required this.color,
      required this.id,
      required this.images,
      required this.isFavotite,
      required this.price,
      required this.rating,
      required this.sd,
      required this.ssd,
      required this.title});

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

  factory ProductDetailEntity.fromMap(Map<String, dynamic> map) {
    return ProductDetailEntity(
      cpu: map['cpu'] ?? '',
      camera: map['camera'] ?? '',
      capacity: List<dynamic>.from(map['capacity']),
      color: List<dynamic>.from(map['color']),
      id: map['id'] ?? '',
      images: List<dynamic>.from(map['images']),
      isFavotite: map['isFavotite'] ?? false,
      price: map['price']?.toInt() ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      sd: map['sd'] ?? '',
      ssd: map['ssd'] ?? '',
      title: map['title'] ?? '',
    );
  }

  factory ProductDetailEntity.fromJson(String source) =>
      ProductDetailEntity.fromMap(json.decode(source));
}
