import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';

class HomeStoreModel extends HomeStoreEntity {
  HomeStoreModel({
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

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
    return HomeStoreModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
    );
  }
}

class HomeBestSellerModel extends BestSellerEntity {
  HomeBestSellerModel(
      {required id,
      required isFavorites,
      required title,
      required priceWithoutDiscount,
      required discountPrice,
      required picture})
      : super(
            discountPrice: discountPrice,
            id: id,
            title: title,
            priceWithoutDiscount: priceWithoutDiscount,
            picture: picture,
            isFavorites: isFavorites);
  factory HomeBestSellerModel.fromJson(Map<String, dynamic> json) {
    return HomeBestSellerModel(
        id: json['id'],
        isFavorites: json['is_favorites'],
        title: json['title'],
        priceWithoutDiscount: json['price_without_discount'],
        discountPrice: json['discount_price'],
        picture: json['picture']);
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
