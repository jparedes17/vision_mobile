import 'package:flutter/material.dart';
import 'package:vision_proyecto/models/models.dart';
import 'package:vision_proyecto/screens/agenda.dart';
import 'package:vision_proyecto/screens/home_screen.dart';
import 'package:vision_proyecto/screens/inicio.dart';
import 'package:vision_proyecto/screens/inscripciones.dart';
import 'package:vision_proyecto/screens/publicaciones.dart';
import 'package:vision_proyecto/widgets/splash.dart';

class AppRoutes {
  static const initialRoute = 'splash';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'inicio',
        icon: Icons.home,
        name: 'Inicio',
        screen: const InicioScreen(),
        position: 0),
    MenuOption(
        route: 'publicaciones',
        icon: Icons.book,
        name: 'Publicaciones',
        screen: const PublicacionesScreen(),
        position: 1),
    MenuOption(
        route: 'agenda',
        icon: Icons.assignment_turned_in_sharp,
        name: 'Agenda',
        screen: const AgendaScreen(),
        position: 2),
    MenuOption(
        route: 'inscripciones',
        icon: Icons.app_registration_rounded,
        name: 'Inscripciones',
        screen: const InscripcionesScreen(),
        position: 3),
  ];

  static final routesAlternatives = [
    {'home' : (BuildContext context) =>  HomeScreen()},
    {'splash' : (BuildContext context) =>  const SplashScreen()},
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (var router in routesAlternatives) {
      appRoutes.addAll(router);
    }

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
