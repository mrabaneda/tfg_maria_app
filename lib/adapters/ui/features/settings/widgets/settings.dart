import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/settings/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const BaseAppBar(title: "Ajustes"),
          child: Padding(
            padding: CommonTheme.defaultBodyPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _SettingItem(
                  title: 'Contacto con VALE',
                  icon: Icon(Icons.contacts_rounded),
                  url: "https://asvale.org/",
                ),
                SizedBox(height: hJM(2)),
                _SettingItem(
                  title: 'Comunicador en línea',
                  icon: Icon(Icons.record_voice_over_rounded),
                  url: "https://grid.asterics.eu/#grid/grid-data-1711313967865-120",
                ),
                SizedBox(height: hJM(2)),
                _SettingItem(
                  title: 'Crear historias',
                  icon: Icon(Icons.auto_stories_rounded),
                  url: "https://infinitas-historias.web.app/",
                ),
                SizedBox(height: hJM(2)),
                _SettingItem(title: 'Modo pantalla completa', icon: Icon(Icons.fullscreen_rounded), url: ""),
                SizedBox(height: hJM(2)),
                _SettingItem(title: 'Ajustar tamaño de letra', icon: Icon(Icons.text_fields_rounded), url: ""),
                SizedBox(height: hJM(2)),
                BaseButton(
                  width: double.infinity,
                  height: hJM(7),
                  text: "Cerrar sesión",
                  textStyle: CommonTheme.bodyMediumLightStyle,
                  icon: Icon(
                    Icons.power_settings_new_rounded,
                    color: CommonTheme.backgroundColor,
                    size: wJM(4),
                  ),
                  backgroundColor: CommonTheme.errorColor,
                  onClick: () => showSignOutDialog(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final String url;

  const _SettingItem({
    required this.title,
    required this.icon,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {if (url.isNotEmpty) launchUrl(Uri.parse(url))},
      child: Container(
        height: hJM(7),
        padding: CommonTheme.defaultButtonPadding,
        decoration: BoxDecoration(
          borderRadius: CommonTheme.defaultButtonRadius,
          border: Border.all(
            color: CommonTheme.statusBarColor,
          ),
          color: CommonTheme.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: wJM(1)),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CommonTheme.bodyMediumStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
