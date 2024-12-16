import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/core/utils/app_text_style.dart';

class AppDialog {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: AppColor.whiteColor,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
                Gap(8.w),
                Text(
                  message,
                  style: AppTextStyle.textStyle22CP.copyWith(
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text(
                'ok',
                style: AppTextStyle.textStyle22CP.copyWith(
                  color: AppColor.blackColor,
                ),
              ),
            )
          ],
          title: Icon(
            Icons.warning_amber,
            color: AppColor.redColor,
            size: 30.sp,
          ),
          content: Text(
            message,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textStyle12CP.copyWith(
              fontSize: 14.sp,
              color: AppColor.blackColor,
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      behavior: SnackBarBehavior.floating,
      width: 300.w,
      duration: const Duration(milliseconds: 300),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
