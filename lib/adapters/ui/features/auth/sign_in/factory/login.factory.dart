import 'package:tfg_maria_app/core/domain/entities/login.entity.dart';
import 'package:tfg_maria_app/core/domain/value_objects/login_password.vo.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login.model.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login_password.model.dart';

class LoginFactory {
  static LoginModel modelFromEntity(LoginEntity entity) {
    return LoginModel(
      email: entity.email,
      photoUrl: entity.photoUrl,
      photoRelativePath: entity.photoRelativePath,
      photoName: entity.photoName,
      passwordModel: entity.passwordModel.map(_passwordModelFromEntity).toList(),
    );
  }

  static LoginPasswordModel _passwordModelFromEntity(LoginPasswordVO entity) {
    return LoginPasswordModel(
      photoUrl: entity.photoUrl,
      passwordPiece: entity.passwordPiece,
      photoRelativePath: entity.photoRelativePath,
      photoName: entity.photoName,
    );
  }
}
