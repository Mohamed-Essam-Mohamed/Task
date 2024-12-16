import 'package:flutter/material.dart';
import 'package:tasky/core/common/screens/internet_screen.dart';
import 'package:tasky/core/routes/animation_routes.dart';
import 'package:tasky/featuers/auth/screens/login_screen.dart';
import 'package:tasky/featuers/auth/screens/register_screen.dart';
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
        return AnimationRoute(page: const LoginScreen());
      case RegisterScreen.routeName:
        return AnimationRoute(page: RegisterScreen());

      default:
        return AnimationRoute(page: const InternetScreen());
    }
  }
}
