import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_out/providers/sign_out_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class SignOutDialog extends ConsumerWidget {
  const SignOutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      signOutControllerProvider.select((value) => value.isDone),
      (_, isDone) {
        if (isDone && Navigator.of(context).canPop()) {
          Navigator.pop(context, false);
        }
      },
    );

    return Dialog(
      surfaceTintColor: CommonTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: CommonTheme.defaultCardRadius),
      child: Container(
        padding: EdgeInsets.all(hJM(3)),
        height: hJM(35),
        width: wJM(70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.power_settings_new_outlined, color: CommonTheme.errorColor, size: hJM(4)),
                SizedBox(width: wJM(2)),
                SizedBox(
                  height: hJM(4.5),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Cerrar sesión', style: CommonTheme.titleLarge),
                  ),
                ),
              ],
            ),
            Text(
              '¿Desea cerrar sesión?',
              style: CommonTheme.bodyLargeStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseButton(
                  text: "Cancelar",
                  height: hJM(6),
                  width: wJM(23),
                  loading: ref.watch(signOutControllerProvider.select((value) => value.isLoading)),
                  backgroundColor: CommonTheme.cancelButtonColor,
                  onClick: () => Navigator.pop(context, false),
                ),
                SizedBox(width: wJM(2)),
                BaseButton(
                  text: 'Cerrar sesión',
                  height: hJM(6),
                  width: wJM(32),
                  loading: ref.watch(signOutControllerProvider.select((value) => value.isLoading)),
                  backgroundColor: CommonTheme.errorColor,
                  onClick: () => ref.read(signOutControllerProvider.notifier).signOut(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
