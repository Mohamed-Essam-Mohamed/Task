import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/app/check_internet.dart';
import 'package:tasky/core/app/service_locator%20.dart';
import 'package:tasky/core/common/screens/internet_screen.dart';
import 'package:tasky/core/routes/app_routes.dart';
import 'package:tasky/splash_screen.dart';

class TaskYApp extends StatefulWidget {
  const TaskYApp({super.key});

  @override
  State<TaskYApp> createState() => _TaskYAppState();
}

class _TaskYAppState extends State<TaskYApp> {
  @override
  void initState() {
    sl<CheckInternet>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );

        // ValueListenableBuilder(
        //   valueListenable: CheckInternet.isConnected,
        //   builder: (_, value, __) {
        //     if (value) {
        //       return ;
        //     } else {
        //       return MaterialApp(
        //         debugShowCheckedModeBanner: false,
        //         home: InternetScreen(),
        //       );
        //     }
        //   },
        // );
      },
    );
  }
}
