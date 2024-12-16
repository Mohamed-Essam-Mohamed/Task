import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasky/app_task_y.dart';
import 'package:tasky/core/app/service_locator%20.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const TaskYApp()));
}
