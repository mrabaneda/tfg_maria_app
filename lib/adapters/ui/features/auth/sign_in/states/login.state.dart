import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login.model.dart';

class LoginState {
  final AsyncValue<bool> asyncState;
  final List<LoginModel> logins;

  LoginState({
    required this.asyncState,
    required this.logins,
  });

  factory LoginState.initial() => LoginState(
        asyncState: const AsyncData(false),
        logins: [],
      );

  LoginState copyWith({
    AsyncValue<bool>? asyncState,
    List<LoginModel>? logins,
  }) {
    return LoginState(
      asyncState: asyncState ?? this.asyncState,
      logins: logins ?? this.logins,
    );
  }
}
