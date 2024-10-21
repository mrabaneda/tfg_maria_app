import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/use_cases/login/get_login.use_case.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/states/login.state.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/factory/login.factory.dart';

class LoginController extends StateNotifier<LoginState> {
  final GetLoginUseCase getLoginUseCase;

  LoginController({required this.getLoginUseCase}) : super(LoginState.initial()) {
    init();
  }

  void setLoginIndex(int index) {
    if (!mounted) return;
    state = state.copyWith(loginIndex: index);
  }

  Future<void> init() async {
    try {
      if (!state.asyncState.isLoading) {
        if (mounted) state = state.copyWith(asyncState: const AsyncLoading());
      }

      final logins = await getLoginUseCase.execute();

      if (mounted) {
        state = state.copyWith(
          logins: logins.map(LoginFactory.modelFromEntity).toList(),
          asyncState: const AsyncData(true),
        );
      }
    } on Exception catch (ex) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(ex, StackTrace.current));
    } catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    }
  }
}
