part of 'category_cubit.dart';

abstract class CategoryStateCubit extends Equatable {
  const CategoryStateCubit();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryStateCubit {}

class CategoryLoadedState extends CategoryStateCubit {
  List<CategoryEntity> categoryEntity;
  CategoryLoadedState({required this.categoryEntity});
}

class CategoryChangedState extends CategoryStateCubit {
  List<CategoryEntity> categoryEntity;
  CategoryChangedState({required this.categoryEntity});
}
