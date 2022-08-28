import 'dart:developer';

import 'package:ecommerce_project/features/main/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/cubit/category_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import '../../domain/entities/category_entity.dart';
import 'category_round_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryStateCubit>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        return Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CategoryRoundButton(
                index: index,
                onPressed: () {
                  if (index < categories.length) {
                    BlocProvider.of<CategoryCubit>(context)
                        .changeCategory(categories, index);
                  }
                },
                categories: categories,
              );
            },
          ),
        );
      },
    );
  }
}
