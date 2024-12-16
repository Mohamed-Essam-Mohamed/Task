import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tasky/core/data/api/api_contumer/api_consumer.dart';
import 'package:tasky/core/data/api/errors/failure.dart';
import 'package:tasky/core/data/api/keys/keys_api.dart';
import 'package:tasky/core/data/model/request/login_request.dart';
import 'package:tasky/core/data/model/response/login_response.dart';

class ApiAuth {
  ApiConsumer apiConsumer;
  ApiAuth({required this.apiConsumer});

  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest request}) async {
    try {
      var response =
          await apiConsumer.post(KeysApi.endPointLogin, data: request.toJson());
      return Right(LoginResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          "There is invalid in the phone number or password try again"));
    } on SocketException catch (e) {
      return Left(ServerFailure("No Internet Connection"));
    }
  }
}
