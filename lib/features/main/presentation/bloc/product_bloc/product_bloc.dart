import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_detail_entity.dart';
import '../../../domain/usecases/get_home_store.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetHomeStore getHomeStoreBloc;
  ProductBloc({required this.getHomeStoreBloc}) : super(ProductInitialState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProduntLoadingState());
      late ProductDetailEntity productDetailElement;

      final failureOrProduct = await getHomeStoreBloc.getProductDetail();

      failureOrProduct.fold((failure) => ProductErrorState(),
          (productElement) => productDetailElement = productElement);

      emit(ProductLoadedState(productDetail: productDetailElement));
      print('1');
    });
  }
}
