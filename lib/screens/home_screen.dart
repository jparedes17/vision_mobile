import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vision_proyecto/providers/ui_provider.dart';
import 'package:vision_proyecto/screens/agenda.dart';
import 'package:vision_proyecto/screens/inicio.dart';
import 'package:vision_proyecto/screens/inscripciones.dart';
import 'package:vision_proyecto/screens/publicaciones.dart';
import 'package:vision_proyecto/widgets/navbar.dart';

class HomeScreen extends StatelessWidget {
  
  HomeScreen({Key? key}) : super(key: key);
  
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Navbar(),
      appBar: AppBar(
        title: const _HomeTitle(),
        leading: IconButton(onPressed: () => _scaffoldKey.currentState!.openDrawer(), icon: const Icon(Icons.menu, color: Colors.white,)),
      ),
      body: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const InicioScreen();

      case 1:
        return const PublicacionesScreen();

      case 2:
        return const AgendaScreen();

      case 3:
        return const InscripcionesScreen();

      default:
      return const InicioScreen();
    }
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const Text('Inicio', style: TextStyle(color: Colors.white),);

      case 1:
        return const Text('Publicaciones', style: TextStyle(color: Colors.white));

      case 2:
        return const Text('Agenda', style: TextStyle(color: Colors.white));

      case 3:
        return const Text('Inscripciones', style: TextStyle(color: Colors.white));
      default:
      return const Text('Inicio', style: TextStyle(color: Colors.white));
    }
  }
}