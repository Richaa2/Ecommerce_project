import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/core/error/failure.dart';
import 'package:ecommerce_project/features/main/domain/entities/home_page_entity.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          List<HomePageEntity> homepageElement = [];
          if (state is MainInitial) {
            BlocProvider.of<MainBloc>(context, listen: false).add(LoadEvent());
          }
          if (state is MainLoadedState) {
            homepageElement = state.homePage;
            return ListView.builder(itemBuilder: ((context, index) {
              print(homepageElement.length);
              return Text('');
            }));
          }
          return Container();
        });
      },
    );
  }
}
