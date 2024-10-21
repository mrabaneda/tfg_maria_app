import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/widgets/sign_in_item.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/providers/login_controller.provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: Body(
          child: Padding(
            padding: EdgeInsets.only(top: hJM(4)),
            child: loginState.asyncState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (_) {
                return SignInItem(logins: loginState.logins);
              },
            ),
          ),
        ),
      ),
    );
  }
}
