import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';

class HomeStoreModel extends HomeStoreEntity {
  HomeStoreModel({
    required isNew,
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
            picture: picture,
            isNew: isNew);

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
    return HomeStoreModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      picture: json['picture'],
      isBuy: json['is_buy'],
      isNew: json['is_new'] ?? false,
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
