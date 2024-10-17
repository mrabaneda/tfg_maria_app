import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/shared/states/global_state.dart';
import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/value_objects/nullable.dart';
import 'package:tfg_maria_app/core/use_cases/auth/get_auth_user.use_case.dart';

class GloblalController extends StateNotifier<GlobalState> {
  final GetAuthUserUseCase getAuthUserUseCase;

  GloblalController({
    required this.getAuthUserUseCase,
    AuthUserEntity? authUser,
  }) : super(GlobalState.initial(authUser: authUser)) {
    init();
  }

  Future<void> init() async {
    try {
      if (state.authUser == null) {
        if (mounted) state = state.copyWith(asyncState: const AsyncData(true), authUser: Nullable(null));
        return;
      }

      if (!state.asyncState.isLoading) {
        if (mounted) state = state.copyWith(asyncState: const AsyncLoading());
      }

      final authUser = getAuthUserUseCase.execute();

      if (mounted) {
        state = state.copyWith(
          authUser: Nullable(authUser),
          asyncState: const AsyncData(true),
        );
      }
    } on Exception catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    } catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    }
  }
}
