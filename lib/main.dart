import 'package:ecommerce_project/features/main/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/cubit/category_cubit.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:ecommerce_project/locator_service.dart' as di;
import 'package:ecommerce_project/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/main/presentation/pages/first_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => sl<MainBloc>(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'MarkPro',
          primaryColor: Color(0xffE5E5E5),
        ),
        home: FirstPage(),
      ),
    );
  }
}
