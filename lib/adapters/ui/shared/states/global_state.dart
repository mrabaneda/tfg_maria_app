import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/value_objects/nullable.dart';

class GlobalState {
  final AuthUserEntity? authUser;
  final AsyncValue<bool> asyncState;

  GlobalState({
    required this.authUser,
    required this.asyncState,
  });

  factory GlobalState.initial({AuthUserEntity? authUser}) {
    return GlobalState(
      authUser: authUser,
      asyncState: const AsyncLoading(),
    );
  }

  GlobalState copyWith({
    Nullable<AuthUserEntity?>? authUser,
    AsyncValue<bool>? asyncState,
  }) {
    return GlobalState(
      authUser: authUser == null ? this.authUser : authUser.value,
      asyncState: asyncState ?? this.asyncState,
    );
  }

  bool get isAuthenticated => authUser != null;
}
