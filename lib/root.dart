import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/widgets/sign_in_page.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/widgets/nav_bar.dart';
import 'package:tfg_maria_app/adapters/ui/providers/global_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/error_app.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/loading_app.dart';

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalState = ref.watch(globalControllerProvider);

    if (globalState.asyncState.isError) {
      return const SafeArea(
        child: Scaffold(
          body: ErrorApp(),
        ),
      );
    }

    if (globalState.asyncState.isLoading) {
      return const SafeArea(
        child: Scaffold(
          body: LoadingApp(),
        ),
      );
    }

    if (!globalState.isAuthenticated) return const SignInPage();

    return const NavBar();
  }
}
