import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/use_cases/auth/sig_in_use_case.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/controllers/sign_in.controller.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/states/sign_in.state.dart';

final signInControllerProvider = AutoDisposeStateNotifierProvider<SignInController, SignInState>(
  (ref) => SignInController(
    signInUseCase: ref.watch(signInUseCaseProvider),
  ),
);
