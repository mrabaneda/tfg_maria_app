import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/repositories/login_repository.provider.dart';
import 'package:tfg_maria_app/core/use_cases/login/get_login.use_case.dart';

final getLoginUseCaseProvider = AutoDisposeProvider<GetLoginUseCase>(
  (ref) => GetLoginUseCase(loginRepository: ref.watch(loginRepositoryProvider)),
);
