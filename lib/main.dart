import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vision_proyecto/providers/ui_provider.dart';
import 'package:vision_proyecto/router/app_routes.dart';
import 'package:vision_proyecto/theme/app.theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UiProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        theme: Apptheme.lightTheme,
      ),
    );
  }
}
