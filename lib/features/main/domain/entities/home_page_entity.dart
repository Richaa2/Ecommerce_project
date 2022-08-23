import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class HomePageEntity extends Equatable {
  List<HomeStoreEntity> homeStoreEntity;
  List<BestSellerEntity> bestSellerEntity;
  HomePageEntity({
    required this.homeStoreEntity,
    required this.bestSellerEntity,
  });

  @override
  List<Object> get props => [homeStoreEntity, bestSellerEntity];
}

class HomeStoreEntity extends Equatable {
  final int id;
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;
  HomeStoreEntity({
    required this.id,
    this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  factory HomeStoreEntity.fromJson(Map<String, dynamic> json) {
    return HomeStoreEntity(
        isNew: json['is_new'],
        id: json['id'],
        title: json['title'],
        subtitle: json['subtitle'],
        picture: json['picture'],
        isBuy: json['is_buy']);
  }

  @override
  List<Object?> get props => [id, isNew, title, subtitle, picture, isBuy];
}

class BestSellerEntity {
  int id;
  bool isFavorites;
  String title;
  int priceWithoutDiscount;
  int discountPrice;
  String picture;
  BestSellerEntity({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  factory BestSellerEntity.fromJson(Map<String, dynamic> json) {
    return BestSellerEntity(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      discountPrice: json['discount_price'],
      isFavorites: json['is_favorites'],
      priceWithoutDiscount: json['price_without_discount'],
    );
  }
}
