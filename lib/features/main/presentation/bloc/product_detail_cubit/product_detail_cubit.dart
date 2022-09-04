import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductChangedColorState());

  void changeColor(ProductDetailState state) {
    if (state is ProductChangedSecondColorState) {
      emit(ProductChangedColorState());
    } else {
      emit(ProductChangedSecondColorState());
    }
  }
}
