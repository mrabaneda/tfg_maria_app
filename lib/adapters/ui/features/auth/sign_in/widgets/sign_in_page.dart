import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/widgets/sign_in_item.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/widgets/sign_in_password.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/providers/login_controller.provider.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);
    return SafeArea(
      child: Scaffold(
        body: Body(
          child: loginState.asyncState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (_) {
              return Padding(
                padding: EdgeInsets.all(hJM(3)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Bienvenido/a a tu APP de VALE.', style: CommonTheme.titleMedium),
                    SizedBox(height: hJM(3)),
                    Text('Selecciona tu perfil:', style: CommonTheme.titleSmall),
                    SizedBox(height: hJM(3)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.0),
                        borderRadius: BorderRadius.circular(wJM(3)),
                      ),
                      height: hJM(90),
                      child: Scrollbar(thumbVisibility: true, child: SignInItem(logins: loginState.logins)),
                    ),
                    SizedBox(height: hJM(3)),
                    BaseButton(
                      backgroundColor: CommonTheme.secondaryColor,
                      width: wJM(50),
                      text: "Continuar",
                      isEnabled: loginState.loginIndex >= 0,
                      onClick: () => Navigator.push(
                        context,
                        fadeTransitionRoute(
                          SignInPassword(
                            loginPasswords: loginState.logins[loginState.loginIndex].passwordModel,
                            selectedEmail: loginState.logins[loginState.loginIndex].email,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
