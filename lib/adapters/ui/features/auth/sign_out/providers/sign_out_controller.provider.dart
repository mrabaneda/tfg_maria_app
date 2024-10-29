import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/use_cases/auth/sign_out_use_case.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_out/controllers/sign_out.controller.dart';

final signOutControllerProvider = AutoDisposeStateNotifierProvider<SignOutController, AsyncValue<bool>>(
  (ref) => SignOutController(
    signOutUseCase: ref.watch(signOutUseCaseProvider),
  ),
);
