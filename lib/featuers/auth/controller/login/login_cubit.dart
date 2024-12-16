import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/data/api/api_mange/api_auth.dart';
import 'package:tasky/core/data/model/request/login_request.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.apiAuth}) : super(LoginInitial());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  PhoneNumber? phoneNumber;

  ApiAuth apiAuth;

  Future<void> login() async {
    if (formKey.currentState!.validate() &&
        phoneNumber != null &&
        phoneNumber!.isValidNumber()) {
      emit(LoginLoading());
      var either = await apiAuth.login(
        request: LoginRequest(
          phone: phoneNumber!.completeNumber ?? "+201010558261",
          password: passwordController.text,
        ),
      );
      either.fold(
        (l) => emit(LoginError(l.message)),
        (r) {
          emit(LoginSuccess());
        },
      );
    }
  }
}
