import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';

class SignOutUseCase {
  final BaseAuthService authService;

  SignOutUseCase({required this.authService});

  Future<void> execute() => authService.signOut();
}
