import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firebase_auth/services/firebase.service.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firebase_auth/services/firebase_auth.service.dart';

final authServiceProvider = AutoDisposeProvider<BaseAuthService>(
  (ref) => FireBaseAuthService(
    auth: ref.watch(firebaseAuthProvider),
  ),
);
