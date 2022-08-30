part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {}

class ProduntLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final ProductDetailEntity productDetail;

  ProductLoadedState({required this.productDetail});
}

class ProductErrorState extends ProductState {}
