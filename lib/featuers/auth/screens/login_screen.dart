import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/common/widgets/material_button_widget.dart';
import 'package:tasky/core/constant/app_assets.dart';
import 'package:tasky/core/extensions/context_extention.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';
import 'package:tasky/featuers/auth/screens/register_screen.dart';
import 'package:tasky/featuers/auth/widget/login_or_register_widget.dart';
import 'package:tasky/featuers/auth/widget/text_form_field_phone_widget.dart';
import 'package:tasky/splash_screen.dart';

import '../../../core/common/widgets/text_form_filed_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.imageArt,
                width: double.infinity,
                height: 380.h,
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
                    controller: TextEditingController(),
                    validator: (value) {},
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
                    controller: TextEditingController(),
                    validator: (value) {},
                  ),
                ),
              ),
              Gap(20.h),
              BounceInDown(
                from: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: MaterialButtonWidget(
                    onPressed: () {},
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
    );
  }
}
