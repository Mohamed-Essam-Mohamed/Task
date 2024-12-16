import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/extensions/context_extention.dart';
import 'package:tasky/core/utils/app_color.dart';
import 'package:tasky/featuers/auth/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => context.pushNamedAndRemoveUntil(StartScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInLeft(
              child: SvgPicture.asset(
                "assets/icons/logo-task.svg",
                width: 100.sp,
                height: 35.sp,
                fit: BoxFit.contain,
              ),
            ),
            BounceInDown(
              from: 50,
              delay: const Duration(milliseconds: 800),
              child: SvgPicture.asset(
                "assets/icons/logo-y.svg",
                width: 100.sp,
                height: 35.sp,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
