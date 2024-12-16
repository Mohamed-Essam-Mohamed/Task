import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/common/widgets/material_button_widget.dart';
import 'package:tasky/core/constant/app_assets.dart';
import 'package:tasky/core/extensions/context_extention.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_dailog.dart';
import 'package:tasky/core/utils/app_text_style.dart';
import 'package:tasky/featuers/auth/controller/login/login_cubit.dart';
import 'package:tasky/featuers/auth/screens/register_screen.dart';
import 'package:tasky/featuers/auth/widget/login_or_register_widget.dart';
import 'package:tasky/featuers/auth/widget/text_form_field_phone_widget.dart';

import '../../../core/app/service_locator .dart';
import '../../../core/common/widgets/text_form_filed_widget.dart';
import '../../home/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = '/login-screen';
  LoginCubit cubit = sl<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: BlocListener<LoginCubit, LoginState>(
              bloc: cubit,
              listener: (context, state) {
                if (state is LoginLoading) {
                  AppDialog.showLoading(
                    context: context,
                    message: "Loading...",
                  );
                }
                if (state is LoginSuccess) {
                  context.pop();
                  AppDialog.showSnackBar(context, "Login Success");
                  context.pushNamedAndRemoveUntil(HomeScreen.routeName);
                }
                if (state is LoginError) {
                  context.pop();
                  AppDialog.showMessage(
                      context: context, message: state.message);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.imageArt,
                    width: double.infinity,
                    height: 360.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                  FadeInLeft(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.h, bottom: 20.h),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: AppTextStyle.textStyle24CP.copyWith(
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FadeIn(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: TextFormFieldPhoneWidget(
                        controller: cubit.phoneController,
                        onChanged: (p0) {
                          cubit.phoneNumber = p0;
                        },
                        validator: (value) {
                          final phoneRegex = RegExp(r'^[0-9]{10}$');

                          if (value == null || value.number.trim().isEmpty) {
                            return "Please enter a phone number";
                          }
                          if (!phoneRegex.hasMatch(value.completeNumber)) {
                            return "Enter a valid phone number (10 digits)";
                          }
                          return null; // No errors
                        },
                      ),
                    ),
                  ),
                  Gap(15.h),
                  FadeIn(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: TextFormFieldWidget(
                        isPassword: true,
                        obscureText: true,
                        hintText: "Password...",
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a password";
                          }

                          // if (value.length < 6) {
                          //   return "Password must be at least 6 characters";
                          // }

                          // if (value.length > 20) {
                          //   return "Password must be less than 20 characters";
                          // }

                          // if (!value.contains(RegExp(r'[A-Z]'))) {
                          //   return "Password must contain at least one uppercase letter";
                          // }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Gap(20.h),
                  BounceInDown(
                    from: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: MaterialButtonWidget(
                        onPressed: () async {
                          await cubit.login();
                        },
                        text: "Sign In",
                      ),
                    ),
                  ),
                  Gap(20.h),
                  LoginOrRegisterWidget(
                    text: "Don't have an account? ",
                    focusText: "Sign Up here",
                    onTap: () {
                      context.pushNamed(RegisterScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
