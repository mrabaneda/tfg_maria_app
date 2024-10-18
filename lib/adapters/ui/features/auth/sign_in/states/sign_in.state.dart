import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/value_objects/nullable.dart';

class SignInState {
  final AsyncValue<bool> asyncState;
  final String email;
  final String password;
  final String? errorSignInPassword;

  SignInState({
    required this.asyncState,
    required this.email,
    required this.password,
    required this.errorSignInPassword,
  });

  factory SignInState.initial() => SignInState(
        asyncState: const AsyncData(false),
        email: "",
        password: "",
        errorSignInPassword: null,
      );

  SignInState copyWith({
    AsyncValue<bool>? asyncState,
    String? email,
    String? password,
    Nullable<String?>? errorSignInPassword,
  }) {
    return SignInState(
      asyncState: asyncState ?? this.asyncState,
      email: email ?? this.email,
      password: password ?? this.password,
      errorSignInPassword: errorSignInPassword == null ? this.errorSignInPassword : errorSignInPassword.value,
    );
  }
}
