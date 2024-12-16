// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';

class LoginOrRegisterWidget extends StatelessWidget {
  const LoginOrRegisterWidget({
    Key? key,
    required this.text,
    required this.focusText,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final String focusText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.textStyle12CP.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            focusText,
            style: AppTextStyle.textStyle12CP.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              decoration: TextDecoration.underline, // Add underline
              decorationColor: AppColor.primaryColor, // Set underline color
              decorationThickness: 1,
              height: 0, // Underline thickness
            ),
          ),
        ),
      ],
    );
  }
}
