import 'package:ecommerce_project/core/platform/network_info.dart';
import 'package:ecommerce_project/features/main/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce_project/features/main/data/repositories/home_repository_impl.dart';
import 'package:ecommerce_project/features/main/domain/repositories/home_repository.dart';
import 'package:ecommerce_project/features/main/domain/usecases/get_home_store.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/main_bloc.dart';
import 'package:ecommerce_project/features/main/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

init() {
  sl.registerFactory(
    () => MainBloc(getHomeStoreBloc: sl()),
  );
  sl.registerFactory(() => ProductBloc(getProductDetail: sl()));
  sl.registerFactory(() => CartBloc(getHomeStoreBloc: sl()));
  sl.registerLazySingleton(() => GetUseCases(homeRepository: sl()));
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: http.Client()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
