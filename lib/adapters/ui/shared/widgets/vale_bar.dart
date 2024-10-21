import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class ValeBar extends StatelessWidget {
  const ValeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CommonTheme.barHeight,
      decoration: BoxDecoration(color: CommonTheme.valeBarColor),
      child: Center(
        child: Image.asset(
          valeLogo,
          alignment: Alignment.center,
          height: hJM(2.5),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
