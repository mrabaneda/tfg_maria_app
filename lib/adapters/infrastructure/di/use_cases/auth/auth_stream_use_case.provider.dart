import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/use_cases/auth/auth_stream.use_case.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/services/auth_service.provider.dart';

final authStreamUseCaseProvider = AutoDisposeStreamProvider<AuthUserEntity?>(
  (ref) => AuthStreamChangesUseCase(authService: ref.watch(authServiceProvider)).execute(),
);
