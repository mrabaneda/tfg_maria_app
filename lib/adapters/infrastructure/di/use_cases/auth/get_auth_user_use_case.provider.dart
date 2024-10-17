import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/services/auth_service.provider.dart';
import 'package:tfg_maria_app/core/use_cases/auth/get_auth_user.use_case.dart';

final getAuthUserUseCaseProvider = AutoDisposeProvider<GetAuthUserUseCase>(
  (ref) => GetAuthUserUseCase(authService: ref.watch(authServiceProvider)),
);
