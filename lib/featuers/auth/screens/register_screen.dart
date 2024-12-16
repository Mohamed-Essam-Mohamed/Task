import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/constant/app_assets.dart';
import 'package:tasky/core/extensions/context_extention.dart';
import 'package:tasky/featuers/auth/widget/login_or_register_widget.dart';

import '../../../core/common/widgets/material_button_widget.dart';
import '../../../core/common/widgets/text_form_filed_widget.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_text_style.dart';
import '../widget/choose_experience_widget.dart';
import '../widget/text_form_field_phone_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.imageArt,
                width: double.infinity,
                height: 230.h,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              FadeInLeft(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.h, bottom: 20.h),
                  child: Text(
                    "Sign Up",
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
                  child: TextFormFieldWidget(
                    hintText: "Name...",
                    controller: TextEditingController(),
                    validator: (value) {},
                  ),
                ),
              ),
              Gap(15.h),
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
                    hintText: "Years of experience...",
                    controller: TextEditingController(),
                    validator: (value) {},
                  ),
                ),
              ),
              Gap(15.h),
              ChooseExperienceWidget(),
              Gap(15.h),
              FadeIn(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: TextFormFieldWidget(
                    hintText: "Address...",
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
              Gap(15.h),
              BounceInDown(
                from: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: MaterialButtonWidget(
                    onPressed: () {},
                    text: "Sign Up",
                  ),
                ),
              ),
              Gap(20.h),
              LoginOrRegisterWidget(
                text: "Already have an account? ",
                focusText: "Sign in here",
                onTap: () {
                  context.pop();
                },
              ),
              Gap(15.h),
            ],
          ),
        ),
      ),
    );
  }
}
