import 'package:flutter/material.dart';
import 'package:tasky/core/common/screens/internet_screen.dart';
import 'package:tasky/core/routes/animation_routes.dart';
import 'package:tasky/featuers/auth/screens/login_screen.dart';
import 'package:tasky/featuers/auth/screens/register_screen.dart';
import 'package:tasky/featuers/home/screens/add_task_screen.dart';
import 'package:tasky/featuers/home/screens/home_screen.dart';
import 'package:tasky/featuers/home/screens/task_details_screen.dart';
import 'package:tasky/splash_screen.dart';
import 'package:tasky/featuers/auth/screens/start_screen.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        return AnimationRoute(page: const SplashScreen());
      case StartScreen.routeName:
        return AnimationRoute(page: const StartScreen());
      case LoginScreen.routeName:
        return AnimationRoute(page: LoginScreen());
      case RegisterScreen.routeName:
        return AnimationRoute(page: RegisterScreen());
      case HomeScreen.routeName:
        return AnimationRoute(page: HomeScreen());
      case AddTaskScreen.routeName:
        return AnimationRoute(page: AddTaskScreen());
      case TaskDetailsScreen.routeName:
        return AnimationRoute(page: TaskDetailsScreen());

      default:
        return AnimationRoute(page: const InternetScreen());
    }
  }
}
