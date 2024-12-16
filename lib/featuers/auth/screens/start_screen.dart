import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/common/widgets/material_button_widget.dart';
import 'package:tasky/core/constant/app_assets.dart';
import 'package:tasky/core/extensions/context_extention.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';
import 'package:tasky/featuers/auth/screens/login_screen.dart';
import 'package:tasky/splash_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  static const routeName = '/start-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.imageArt,
                width: double.infinity,
                height: 400.h,
                fit: BoxFit.cover,
              ),
              Text(
                "Task Management &\nTo-Do List",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyle24CP.copyWith(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(16.h),
              Text(
                "This productive tool is designed to help\nyou better manage your task\nproject-wise conveniently!",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyle12CP,
              ),
              Gap(32.h),
              BounceInDown(
                from: 50,
                child: MaterialButtonWidget(
                  onPressed: () {
                    context.pushNamed(LoginScreen.routeName);
                  },
                  text: "Let's Start",
                  isIcon: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
