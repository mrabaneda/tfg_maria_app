import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Body(
          child: Center(
            child: Text('SIGN IN DE LA APP'),
          ),
        ),
      ),
    );
  }
}
