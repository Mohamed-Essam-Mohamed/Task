import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/app/check_internet.dart';
import 'package:tasky/core/data/api/api_contumer/api_consumer.dart';
import 'package:tasky/core/data/api/api_mange/api_auth.dart';
import 'package:tasky/featuers/auth/controller/login/login_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    sl.registerFactory<CheckInternet>(
      () => CheckInternet(),
    );
    sl.registerLazySingleton<Dio>(
      () => Dio(),
    );
    sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(dio: sl()),
    );
    sl.registerLazySingleton<ApiAuth>(
      () => ApiAuth(apiConsumer: sl()),
    );
    sl.registerFactory<LoginCubit>(
      () => LoginCubit(apiAuth: sl()),
    );
  }
}
