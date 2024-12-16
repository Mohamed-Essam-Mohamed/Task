import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/app_color.dart';

import '../constant/font_key.dart';

class AppTextStyle {
  static TextStyle textStyle24CP = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.whiteColor,
    fontFamily: fontFamily,
  );
  static TextStyle textStyle22CP = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.whiteColor,
    fontFamily: fontFamily,
  );
  static TextStyle textStyle12CP = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.grayColor,
    fontFamily: fontFamily,
  );
}
