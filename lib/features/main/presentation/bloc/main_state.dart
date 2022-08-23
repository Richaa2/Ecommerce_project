part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  final List<HomePageEntity> homePage;

  MainLoadedState(this.homePage);
}

class MainErrorState extends MainState {}
