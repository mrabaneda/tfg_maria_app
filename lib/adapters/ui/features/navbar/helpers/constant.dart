import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/home/widgets/home.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/models/nav_bar_item.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner.dart';
import 'package:tfg_maria_app/adapters/ui/features/profile/widgets/profile.dart';
import 'package:tfg_maria_app/adapters/ui/features/settings/widgets/settings.dart';
import 'package:tfg_maria_app/adapters/ui/features/shopping_cart/widgets/shopping_cart.dart';

const defaultTab = 2;

final navBarPages = [
  const Planner(),
  const ShoppingCart(),
  const Home(),
  const Profile(),
  const Settings(),
];

final navBarItems = [
  NavBarItem(iconData: Icons.calendar_month_outlined),
  NavBarItem(iconData: Icons.shopping_cart_outlined),
  NavBarItem(iconData: Icons.home_outlined),
  NavBarItem(iconData: Icons.person_outlined),
  NavBarItem(iconData: Icons.settings_outlined),
];

final navBarItemsSelected = [
  NavBarItem(iconData: Icons.calendar_month_rounded),
  NavBarItem(iconData: Icons.shopping_cart_rounded),
  NavBarItem(iconData: Icons.home_rounded),
  NavBarItem(iconData: Icons.person_rounded),
  NavBarItem(iconData: Icons.settings_rounded),
];

final labels = ["Agenda", "Lista Compra", "Inicio", "Perfil", "Ajustes"];
