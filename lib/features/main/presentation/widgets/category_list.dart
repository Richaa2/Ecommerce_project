import 'dart:developer';

import 'package:ecommerce_project/features/main/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/cubit/category_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_entity.dart';
import 'category_round_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryEntity> categories = [
      CategoryEntity(
          icon: Icons.phone_android_outlined, name: 'Phones', selected: true),
      CategoryEntity(
          icon: Icons.computer_outlined, name: 'Computer', selected: true),
      CategoryEntity(
          icon: Icons.health_and_safety_outlined,
          name: 'Health',
          selected: false),
      CategoryEntity(
          icon: Icons.menu_book_outlined, name: 'Books', selected: false),
    ];
    var screenSize = MediaQuery.of(context).size;
    var heightScreen = screenSize.height;
    return BlocConsumer<CategoryCubit, CategoryStateCubit>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CategoryRoundButton(
              index: index,
              onPressed: () {
                BlocProvider.of<CategoryCubit>(context)
                    .changeCategory(categories, index);
              },
              categories: categories,
            );
          },
        );
      },
    );
  }
}
