import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_out/widgets/sign_out_dialog.dart';

Future<bool> showSignOutDialog(BuildContext context) async =>
    await showDialog(
      context: context,
      builder: (context) => const SignOutDialog(),
      barrierDismissible: false,
    ) ??
    false;
