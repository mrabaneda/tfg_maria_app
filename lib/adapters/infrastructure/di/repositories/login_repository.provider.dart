import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/core/domain/ports/repositories/login.repository.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/services/firestore.service.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/repositories/firestore_login.repository.dart';

final loginRepositoryProvider = AutoDisposeProvider<BaseLoginRepository>(
  (ref) => FirestoreLoginRepository(
    loginsCollection: ref.watch(loginsCollectionProvider),
  ),
);
