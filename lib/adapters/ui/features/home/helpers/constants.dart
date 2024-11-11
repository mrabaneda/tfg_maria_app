import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/colors.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class HomeMenuItem {
  final Color color;
  final String title;
  final int navBarIndex;
  final String imagePath;

  HomeMenuItem({
    required this.color,
    required this.title,
    required this.navBarIndex,
    required this.imagePath,
  });
}

List<HomeMenuItem> homeMenuItems = [
  HomeMenuItem(
    color: CommonTheme.secondaryColor,
    title: "Mi Agenda",
    navBarIndex: 0,
    imagePath: plannerImage,
  ),
  HomeMenuItem(
    color: CommonTheme.thirdColor,
    title: "Mis Listas",
    navBarIndex: 1,
    imagePath: listImage,
  ),
  HomeMenuItem(
    color: AppColors.yellowNormal,
    title: "Mi perfil",
    navBarIndex: 3,
    imagePath: profileImage,
  ),
  HomeMenuItem(
    color: CommonTheme.primaryColor,
    title: "Ajustes",
    navBarIndex: 4,
    imagePath: settingsImage,
  ),
];
