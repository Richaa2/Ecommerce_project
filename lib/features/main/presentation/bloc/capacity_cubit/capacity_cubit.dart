import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'capacity_state.dart';

class CapacityCubit extends Cubit<CapacityState> {
  CapacityCubit() : super(CapacityChangedColorState());
  void changeCapacity(CapacityState state) {
    if (state is CapacityChangedSecondColorState) {
      emit(CapacityChangedColorState());
    } else {
      emit(CapacityChangedSecondColorState());
    }
  }
}
