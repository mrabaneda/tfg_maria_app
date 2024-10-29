import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login.model.dart';

class LoginState {
  final AsyncValue<bool> asyncState;
  final List<LoginModel> logins;
  final int loginIndex;

  LoginState({
    required this.asyncState,
    required this.logins,
    required this.loginIndex,
  });

  factory LoginState.initial() => LoginState(
        asyncState: const AsyncData(false),
        logins: [],
        loginIndex: -1,
      );

  LoginState copyWith({
    AsyncValue<bool>? asyncState,
    List<LoginModel>? logins,
    int? loginIndex,
  }) {
    return LoginState(
      asyncState: asyncState ?? this.asyncState,
      logins: logins ?? this.logins,
      loginIndex: loginIndex ?? this.loginIndex,
    );
  }
}
