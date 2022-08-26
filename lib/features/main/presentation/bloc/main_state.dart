part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  final List<HomeStoreEntity> homeStore;
  final List<BestSellerEntity> bestSeller;
  final ProductDetailEntity productDetail;
  final MyCartEntity myCart;
  MainLoadedState({
    required this.myCart,
    required this.productDetail,
    required this.homeStore,
    required this.bestSeller,
  });
}

class MainErrorState extends MainState {}
