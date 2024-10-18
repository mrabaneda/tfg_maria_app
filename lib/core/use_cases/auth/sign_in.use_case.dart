import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';

class SignInUseCase {
  final BaseAuthService authService;

  SignInUseCase({required this.authService});

  Future<void> execute(String email, String password) => authService.signIn(email, password);
}
