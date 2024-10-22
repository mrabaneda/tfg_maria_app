import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/services/auth_service.provider.dart';
import 'package:tfg_maria_app/core/use_cases/auth/sign_out.use_case.dart';

final signOutUseCaseProvider = AutoDisposeProvider<SignOutUseCase>(
  (ref) => SignOutUseCase(authService: ref.watch(authServiceProvider)),
);
