import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isIcon = false});
  final void Function()? onPressed;
  final String text;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      minWidth: 330.w,
      height: 45.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyle.textStyle22CP.copyWith(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(8.h),
          isIcon
              ? SvgPicture.asset("assets/icons/icon-arrow.svg")
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
