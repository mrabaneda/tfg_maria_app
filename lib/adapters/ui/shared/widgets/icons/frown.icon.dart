import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class FrownIcon extends StatelessWidget {
  final Color color;
  final double size;
  final Color backgroundColor;

  const FrownIcon({
    super.key,
    this.color = CommonTheme.statusBarColor,
    this.size = 50.0,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        'assets/icons/frown.svg',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        width: size,
        height: size,
      ),
    );
  }
}
