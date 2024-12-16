import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/core/app/check_internet.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    sl.registerFactory<CheckInternet>(
      () => CheckInternet(),
    );
  }
}
