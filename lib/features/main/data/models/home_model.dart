import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';

class HomeModel extends HomeStoreEntity {
  HomeModel({
    required id,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
            id: id,
            isBuy: isBuy,
            title: title,
            subtitle: subtitle,
            picture: picture);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
    );
  }
}

  // factory HomeModel.fromJson(Map<String, dynamic> json) {
  //   var homeStoreJson = json['home_store'] as List;
  //   var bestSellJson = json['best_seller'] as List;

  //   List<HomeStoreEntity> homeStorePage =
  //       homeStoreJson.map((i) => HomeStoreEntity.fromJson(i)).toList();
  //   List<BestSellerEntity> bestSellerPage =
  //       bestSellJson.map((i) => BestSellerEntity.fromJson(i)).toList();
  //   return HomeModel(
  //       homeStoreEntities: homeStorePage, bestSellerEntities: bestSellerPage);
  // }
 // factory HomeModel.fromJson(Map<String, dynamic> json) {
  //   // var homeStoreJson = json['home_store'] as HomeStoreEntity;

  //   // return HomeModel(
  //   //     homeStoreEntity: HomeStoreEntity(
  //   //       id: json['home_store'][0]['id'],
  //   //       isBuy: json['home_store[0].is_buy'],
  //   //       picture: json['home_store[0].picture'],
  //   //       subtitle: json["home_store[0].subtitle"],
  //   //       title: json['home_store[0].title'],
  //   //     ),
  //   //     bestSellerEntity: BestSellerEntity(
  //   //         discountPrice: json['best_seller[0].discount_price'],
  //   //         id: json['best_seller[0].id'],
  //   //         isFavorites: json['best_seller[0].is_favorites'],
  //   //         picture: json['best_seller[0].picture'],
  //   //         priceWithoutDiscount: json['best_seller[0].price_without_discount'],
  //   //         title: json['best_seller[0].title']));
  // }
