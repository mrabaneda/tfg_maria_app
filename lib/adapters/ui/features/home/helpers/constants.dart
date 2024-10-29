import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/colors.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class HomeMenuItem {
  final Color color;
  final String title;
  final TextStyle style;
  final int navBarIndex;

  HomeMenuItem({
    required this.color,
    required this.title,
    required this.style,
    required this.navBarIndex,
  });
}

List<HomeMenuItem> homeMenuItems = [
  HomeMenuItem(
    color: AppColors.pinkNormalHover,
    title: "Mi Agenda",
    style: CommonTheme.bodyMediumLightStyle,
    navBarIndex: 0,
  ),
  HomeMenuItem(
    color: AppColors.yellowNormalHover,
    title: "Mi Lista de la Compra",
    style: CommonTheme.bodyMediumLightStyle,
    navBarIndex: 1,
  ),
  HomeMenuItem(
    color: AppColors.orangeNormalHover,
    title: "Mi perfil",
    style: CommonTheme.bodyMediumLightStyle,
    navBarIndex: 3,
  ),
  HomeMenuItem(
    color: AppColors.tealNormalHover,
    title: "Ajustes",
    style: CommonTheme.bodyMediumLightStyle,
    navBarIndex: 4,
  ),
];
