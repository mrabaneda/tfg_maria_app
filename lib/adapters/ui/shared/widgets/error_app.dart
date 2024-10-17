import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/providers/global_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class ErrorApp extends ConsumerWidget {
  const ErrorApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            error404Cat,
            alignment: Alignment.center,
            height: hJM(40),
            fit: BoxFit.contain,
          ),
          SizedBox(height: hJM(7)),
          const Text("Oops! Algo ha salido mal..."),
          SizedBox(height: hJM(7)),
          BaseButton(
            text: "Reintentar",
            onClick: () => {ref.refresh(globalControllerProvider)},
            height: hJM(7),
            backgroundColor: CommonTheme.errorColor,
          )
        ],
      ),
    );
  }
}
