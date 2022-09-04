import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/features/main/domain/entities/my_cart_entity.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/get_home_store.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetUseCases getHomeStoreBloc;
  CartBloc({required this.getHomeStoreBloc}) : super(CartInitialState()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoadingState());
      late MyCartEntity myCartElement;

      final failureOrCart = await getHomeStoreBloc.getMyCart();

      failureOrCart.fold((failure) => CartErrorState(),
          (cartElement) => myCartElement = cartElement);

      emit(CartLoadedState(myCart: myCartElement));
    });
  }
}
