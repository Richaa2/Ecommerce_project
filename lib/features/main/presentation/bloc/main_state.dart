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

  MainLoadedState(this.homeStore);
}

class MainErrorState extends MainState {}
