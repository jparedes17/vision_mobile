import 'package:flutter/material.dart';

class MenuOption {

  final String route;
  final IconData icon;
  final String name;
  final Widget screen;
  final int position;

  MenuOption(
    {required this.route, required this.icon, required this.name, required this.screen, required this.position});
}

class AlternativeMenu {

  final String route;
  final String name;
  final Widget screen;

  AlternativeMenu(
    {required this.route, required this.name, required this.screen});
}