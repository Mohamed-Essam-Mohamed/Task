import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/constant/app_assets.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.iconInternet,
            width: 180.w,
            height: 180.h,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
          ),
          Gap(15.h),
          Text(
            "No Internet Connection",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyle24CP.copyWith(
              color: AppColor.primaryColor,
            ),
          ),
          Gap(10.h),
          Text(
            "Please check your network connection and \ntry it agian",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textStyle12CP,
          ),
        ],
      ),
    );
  }
}
