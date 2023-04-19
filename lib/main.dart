import 'package:flutter/material.dart';
import 'package:vision_proyecto/router/app_routes.dart';
import 'package:vision_proyecto/screens/home_screen.dart';

void main() => runApp(MaterialApp(
  home: HomeScreen(),
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
