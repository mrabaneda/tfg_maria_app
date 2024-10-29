import 'package:tfg_maria_app/core/domain/entities/login.entity.dart';

abstract class BaseLoginRepository {
  Future<List<LoginEntity>> get();
}
