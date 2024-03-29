part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final MyCartEntity myCart;

  CartLoadedState({required this.myCart});
}

class CartErrorState extends CartState {}
