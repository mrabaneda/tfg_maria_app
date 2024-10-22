import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/settings/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const BaseAppBar(title: "Ajustes"),
          child: Center(
            child: BaseButton(
              width: wJM(50),
              height: hJM(6),
              text: "Cerrar sesión",
              textStyle: CommonTheme.bodySmallLightStyle,
              icon: Icon(
                Icons.power_settings_new_rounded,
                color: CommonTheme.backgroundColor,
                size: wJM(4),
              ),
              backgroundColor: CommonTheme.errorColor,
              onClick: () => showSignOutDialog(context),
            ),
          ),
        ),
      ),
    );
  }
}
