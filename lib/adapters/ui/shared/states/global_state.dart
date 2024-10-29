import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/enums/preferences_type.enum.dart';
import 'package:tfg_maria_app/core/domain/value_objects/nullable.dart';

class GlobalState {
  final AuthUserEntity? authUser;
  final AsyncValue<bool> asyncState;
  final PreferencesTypeEnum? preference;

  GlobalState({
    required this.authUser,
    required this.asyncState,
    required this.preference,
  });

  factory GlobalState.initial({AuthUserEntity? authUser}) {
    return GlobalState(
      authUser: authUser,
      asyncState: const AsyncLoading(),
      preference: null,
    );
  }

  GlobalState copyWith({
    Nullable<AuthUserEntity?>? authUser,
    AsyncValue<bool>? asyncState,
    Nullable<PreferencesTypeEnum?>? preference,
  }) {
    return GlobalState(
      authUser: authUser == null ? this.authUser : authUser.value,
      asyncState: asyncState ?? this.asyncState,
      preference: preference == null ? this.preference : preference.value,
    );
  }

  bool get isAuthenticated => authUser != null;
}
