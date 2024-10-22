import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/use_cases/auth/sign_out.use_case.dart';

class SignOutController extends StateNotifier<AsyncValue<bool>> {
  final SignOutUseCase signOutUseCase;

  SignOutController({required this.signOutUseCase}) : super(const AsyncData(false));

  Future<void> signOut() async {
    try {
      if (state.isLoading) return;

      if (mounted) state = const AsyncLoading();

      await signOutUseCase.execute();
      if (mounted) state = const AsyncData(true);
    } on Exception catch (ex) {
      if (mounted) state = AsyncError(ex, StackTrace.current);
    } catch (err) {
      if (mounted) state = AsyncError(err, StackTrace.current);
    }
  }
}
