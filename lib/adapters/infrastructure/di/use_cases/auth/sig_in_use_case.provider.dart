import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/use_cases/auth/sign_in.use_case.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/services/auth_service.provider.dart';

final signInUseCaseProvider = AutoDisposeProvider<SignInUseCase>(
  (ref) => SignInUseCase(authService: ref.watch(authServiceProvider)),
);
