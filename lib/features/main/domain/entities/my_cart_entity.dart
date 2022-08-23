import 'package:equatable/equatable.dart';

class MyCartEntity extends Equatable {
  final BasketEntity basket;
  final String delivery;
  final String id;
  final int total;

  MyCartEntity(this.basket, this.delivery, this.id, this.total);

  @override
  List<Object> get props => [basket, delivery, id, total];
}

class BasketEntity {
  final String id;
  final String images;
  final int price;
  final String title;

  BasketEntity(this.id, this.images, this.price, this.title);
}
