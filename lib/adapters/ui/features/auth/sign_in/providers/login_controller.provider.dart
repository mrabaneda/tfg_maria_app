import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/use_cases/login/get_login_use_case.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/states/login.state.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/controllers/login.controller.dart';

final loginControllerProvider = AutoDisposeStateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(
    getLoginUseCase: ref.watch(getLoginUseCaseProvider),
  ),
);
