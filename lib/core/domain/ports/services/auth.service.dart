import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/value_objects/types.dart';

abstract class BaseAuthService {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  AuthUserEntity? getAuthUser();
  Future<Token?> getUserToken();
  Stream<AuthUserEntity?> authStateChanges();
}
