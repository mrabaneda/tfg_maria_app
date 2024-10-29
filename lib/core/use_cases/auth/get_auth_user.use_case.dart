import 'package:tfg_maria_app/core/domain/entities/auth_user.entity.dart';
import 'package:tfg_maria_app/core/domain/ports/services/auth.service.dart';

class GetAuthUserUseCase {
  final BaseAuthService authService;

  GetAuthUserUseCase({required this.authService});

  AuthUserEntity? execute() => authService.getAuthUser();
}
