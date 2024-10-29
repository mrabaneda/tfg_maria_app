import 'package:tfg_maria_app/core/domain/entities/login.entity.dart';
import 'package:tfg_maria_app/core/domain/ports/repositories/login.repository.dart';

class GetLoginUseCase {
  final BaseLoginRepository loginRepository;

  GetLoginUseCase({required this.loginRepository});

  Future<List<LoginEntity>> execute() => loginRepository.get();
}
