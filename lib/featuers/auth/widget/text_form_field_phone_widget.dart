import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_text_style.dart';

class TextFormFieldPhoneWidget extends StatelessWidget {
  const TextFormFieldPhoneWidget(
      {super.key, required this.controller, this.validator, this.onChanged});
  final TextEditingController controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final void Function(PhoneNumber)? onChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      // autovalidateMode: AutovalidateMode.always,
      // disableLengthCheck: true,
      // disableAutoFillHints: true,
      onChanged: onChanged,
      initialCountryCode: 'EG',
      controller: controller,
      cursorColor: AppColor.primaryColor,
      validator: validator,
      style: AppTextStyle.textStyle12CP
          .copyWith(fontSize: 14.sp, color: AppColor.blackColor),
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonMargin: EdgeInsets.only(left: 15.w, right: 0),
      dropdownIcon: Icon(
        Icons.expand_more,
        size: 30,
        color: Colors.grey,
      ),
      dropdownTextStyle: AppTextStyle.textStyle12CP.copyWith(fontSize: 14.sp),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.grayColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColor.redColor,
          ),
        ),
        hintText: "102 576 9624",
        hintStyle: AppTextStyle.textStyle12CP.copyWith(fontSize: 14.sp),
        counter: SizedBox.shrink(),
      ),
    );
  }
}
