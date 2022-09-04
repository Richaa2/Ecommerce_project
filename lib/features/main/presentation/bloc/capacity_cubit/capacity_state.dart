part of 'capacity_cubit.dart';

abstract class CapacityState extends Equatable {
  const CapacityState();

  @override
  List<Object> get props => [];
}

class CapacityChangedColorState extends CapacityState {}

class CapacityChangedSecondColorState extends CapacityState {}
