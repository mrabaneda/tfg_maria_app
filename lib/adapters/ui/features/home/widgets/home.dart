import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/features/home/widgets/home_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const HomeAppBar(),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: CommonTheme.defaultBodyPadding,
              child: const Text('BIENVENIDE a la app. Esto es el inicio de la app.'),
            ),
          ),
        ),
      ),
    );
  }
}
