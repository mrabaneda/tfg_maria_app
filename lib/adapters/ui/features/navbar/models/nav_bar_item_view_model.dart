import 'package:flutter/material.dart';

class NavBarItemViewModel {
  final IconData iconData;
  final bool isSelected;
  final void Function() onPressed;
  final String label;

  NavBarItemViewModel({
    required this.iconData,
    required this.isSelected,
    required this.onPressed,
    required this.label,
  });
}
