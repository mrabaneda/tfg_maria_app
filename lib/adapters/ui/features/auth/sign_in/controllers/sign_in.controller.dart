import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/states/sign_in.state.dart';
import 'package:tfg_maria_app/core/domain/value_objects/nullable.dart';
import 'package:tfg_maria_app/core/use_cases/auth/sign_in.use_case.dart';

class SignInController extends StateNotifier<SignInState> {
  final SignInUseCase signInUseCase;

  SignInController({required this.signInUseCase}) : super(SignInState.initial());

  void setEmail(String email) {
    if (!mounted) return;
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    if (!mounted) return;
    state = state.copyWith(
      password: password,
      errorSignInPassword: password.isEmpty ? Nullable("Debe seleccionar las imágenes en su orden correspondiente") : Nullable(null),
    );
  }

  Future<void> signIn() async {
    try {
      if (state.asyncState.isLoading) return;

      // TODO: review ?
      FocusManager.instance.primaryFocus?.unfocus();

      if (mounted) {
        state = state.copyWith(
          asyncState: const AsyncLoading(),
          errorSignInPassword: Nullable(null),
        );
      }

      if (state.password.trim().isEmpty) {
        if (mounted) {
          state = state.copyWith(
            errorSignInPassword: Nullable("Seleccione sus imágenes"),
            asyncState: const AsyncData(false),
          );
        }
        return;
      }

      await signInUseCase.execute(state.email.trim(), state.password.trim());
      if (mounted) state = state.copyWith(asyncState: const AsyncData(true));
    } on Exception catch (ex) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(ex, StackTrace.current));
    } catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    }
  }
}
