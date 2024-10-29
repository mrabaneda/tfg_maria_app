import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/exit_dialog.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/confirm_dialog.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';

Route fadeTransitionRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => destination,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

Future<bool> showExitDialog(BuildContext context) async =>
    await showDialog(
      context: context,
      builder: (context) => const ExitDialog(),
      barrierDismissible: false,
    ) ??
    false;

Future<bool> errorDialogBuilder(BuildContext context, [String? errorMessage]) async =>
    await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        titleText: 'Error...',
        bodyText: errorMessage ?? 'Lo sentimos, ha ocurrido un error inesperado. Por favor, inténtelo de nuevo más tarde',
        backButtonColor: CommonTheme.errorColor,
        backButtonText: 'Aceptar',
        icon: Icon(
          Icons.error_outline_outlined,
          color: CommonTheme.errorColor,
          size: hJM(4),
        ),
      ),
      barrierDismissible: false,
    ) ??
    false;

Future<bool> warningDialogBuilder(BuildContext context, String warningMessage) async =>
    await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        titleText: 'Aviso',
        bodyText: warningMessage,
        backButtonColor: CommonTheme.warningColor,
        backButtonText: 'Aceptar',
        icon: Icon(
          Icons.warning_amber_outlined,
          color: CommonTheme.warningColor,
          size: hJM(4),
        ),
      ),
      barrierDismissible: false,
    ) ??
    false;

Future<bool> successDialogBuilder(BuildContext context, String successMessage) async =>
    await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        height: hJM(30),
        titleText: 'Éxito',
        bodyText: successMessage,
        backButtonColor: CommonTheme.successColor,
        backButtonText: 'Aceptar',
        icon: Icon(
          Icons.check_circle_outline,
          color: CommonTheme.successColor,
          size: hJM(4),
        ),
      ),
      barrierDismissible: false,
    ) ??
    false;
