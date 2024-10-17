import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/home/widgets/home.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/models/nav_bar_item.dart';

const defaultTab = 0;

final navBarPages = [
  const Home(),
];

final navBarItems = [
  NavBarItem(iconData: Icons.home_outlined),
];

final navBarItemsSelected = [
  NavBarItem(iconData: Icons.home),
];

final labels = ["Inicio"];
