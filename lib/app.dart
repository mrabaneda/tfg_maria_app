import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/myscreenutils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/root.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenUtil.init(context);
    return SafeArea(
      child: MaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: context.media.copyWith(textScaler: const TextScaler.linear(1)),
            child: widget!,
          );
        },
        title: 'App VALE',
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        localizationsDelegates: appLocalizationsDelegates,
        supportedLocales: supportedAppLocales,
        home: const Root(),
      ),
    );
  }
}
