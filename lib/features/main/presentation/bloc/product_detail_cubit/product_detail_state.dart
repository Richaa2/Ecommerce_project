part of 'product_detail_cubit.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductChangedColorState extends ProductDetailState {}

class ProductChangedSecondColorState extends ProductDetailState {}
