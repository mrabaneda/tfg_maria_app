import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/use_cases/auth/auth_stream_use_case.provider.dart';
import 'package:tfg_maria_app/adapters/infrastructure/di/use_cases/auth/get_auth_user_use_case.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/states/global_state.dart';
import 'package:tfg_maria_app/adapters/ui/shared/controllers/global_controller.dart';

final globalControllerProvider = AutoDisposeStateNotifierProvider<GloblalController, GlobalState>(
  (ref) => GloblalController(
    getAuthUserUseCase: ref.watch(getAuthUserUseCaseProvider),
    authUser: ref.watch(authStreamUseCaseProvider.select((value) => value.asData?.value)),
  ),
);
