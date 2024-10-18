import 'package:firebase_auth/firebase_auth.dart';
import 'package:tfg_maria_app/core/exceptions/errors.dart';
import 'package:tfg_maria_app/core/domain/value_objects/types.dart';
import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';

class FireBaseAuthService implements BaseAuthService {
  final FirebaseAuth auth;

  FireBaseAuthService({required this.auth});

  @override
  Future<void> signIn(String email, String password) {
    try {
      if (email.isEmpty) throw WarningException(message: 'Email vacío');
      if (password.isEmpty) throw WarningException(message: 'Contraseña vacía');

      return auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (fex) {
      switch (fex.code) {
        case "invalid-email":
          throw ErrorException(message: "Email inválido");
        case "user-disabled":
          throw ErrorException(message: "Usuario deshabilitado");
        case "user-not-found":
          throw ErrorException(message: "Usuario no encontrado");
        case "wrong-password":
          throw ErrorException(message: "Contraseña incorrecta");
        default:
          rethrow;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() => auth.signOut();

  @override
  AuthUserEntity? getAuthUser() {
    final currentUser = auth.currentUser;
    if (currentUser == null) return null;

    // TODO: review
    return AuthUserEntity(
      uid: currentUser.uid,
      email: currentUser.email!,
      name: currentUser.displayName!,
      photoUrl: currentUser.photoURL!,
    );
  }

  @override
  Future<Token?> getUserToken() async {
    final currentUser = auth.currentUser;
    if (currentUser == null) return null;
    return await currentUser.getIdToken();
  }

  @override
  Stream<AuthUserEntity?> authStateChanges() {
    return auth.authStateChanges().map((user) {
      if (user == null) return null;
      return AuthUserEntity(
        uid: user.uid,
        email: user.email!,
        name: user.displayName!,
        photoUrl: user.photoURL!,
      );
    });
  }
}
