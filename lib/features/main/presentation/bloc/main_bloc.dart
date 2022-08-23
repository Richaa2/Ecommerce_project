import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/get_home_store.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetHomeStore getHomeStoreBloc;
  MainBloc({required this.getHomeStoreBloc}) : super(MainInitial()) {
    on<LoadEvent>((event, emit) async {
      emit(MainLoadingState());
      final currentState = state;
      List<HomeStoreEntity> homeElement = [];

      if (currentState is MainLoadedState) {
        homeElement = currentState.homeStore;
      }
      if (getHomeStoreBloc.getHomeStore() != null) {
        final failureOrHome = await getHomeStoreBloc.getHomeStore();

        emit(failureOrHome.fold((failure) => MainErrorState(),
            (homeElement) => MainLoadedState(homeElement)));
      }
    });

    // on<LoadEvent>((event, emit) {
    //   emit(MainLoadingState());
    //   final List<HomePageEntity> res =
    //       getHomeStore.homeRepository.getHomePage().;
    //   try {
    //     emit(MainLoadedState(res));
    //   } catch (e) {
    //     print(e);
    //   }
    // });
  }
  // FutureOr<void> _onEvent(event, emit) async {
  //   if (state is MainInitial) {
  //     final currentState = state;
  //     var homeElement = [];
  //     if (currentState is MainLoadedState) {
  //       homeElement = currentState.homePage;
  //     }
  //     emit(MainLoadingState());
  //     final failureOrHome = await getHomeStore();

  //     emit(failureOrHome.fold((failure) => MainErrorState(),
  //         (homeElement) => MainLoadedState(homeElement)));
  //   }
  // }
}
