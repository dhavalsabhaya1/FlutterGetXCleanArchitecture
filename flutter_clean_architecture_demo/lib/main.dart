import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_demo/src/config/routes/route_generator.dart';
import 'package:flutter_clean_architecture_demo/src/presentation/ui/home/view/screen_home.dart';
import 'package:get/get.dart';

import 'src/utils/navigator_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const ScreenHome(),
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
      navigatorKey: NavigatorKey.navigatorKey,
      // initialRoute: AppRoutes.routesScreenHome,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
/*    return  MaterialApp(
      home: const ScreenHome(),
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
      navigatorKey: NavigatorKey.navigatorKey,
      initialRoute: AppRoutes.routesScreenHome,
      onGenerateRoute: RouteGenerator.generateRoute,
    );*/
  }
}
