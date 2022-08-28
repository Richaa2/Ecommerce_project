import 'package:bloc/bloc.dart';
import 'package:ecommerce_project/features/main/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryStateCubit> {
  CategoryCubit() : super(CategoryInitial());

  void changeCategory(List<CategoryEntity> categoryEntityList, int index) {
    for (var element in categoryEntityList) {
      element.selected = false;
    }
    categoryEntityList[index].selected = true;
    emit(CategoryLoadedState(categoryEntity: categoryEntityList));
    emit(CategoryInitial());
  }
}
