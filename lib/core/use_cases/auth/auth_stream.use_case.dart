import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';

class AuthStreamChangesUseCase {
  final BaseAuthService authService;

  AuthStreamChangesUseCase({required this.authService});

  Stream<AuthUserEntity?> execute() => authService.authStateChanges();
}
