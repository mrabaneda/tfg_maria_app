import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/providers/nav_bar_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/widgets/bottom_nav_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) async {
          final backRes = ref.read(navBarControllerProvider.notifier).back();
          if (backRes == null) return;
          if (backRes) return;
          if (await showExitDialog(context)) exit(0);
        },
        child: Scaffold(
          extendBody: true,
          body: navBarPages.elementAt(ref.watch(navBarControllerProvider)),
          bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );
  }
}
