import 'package:tfg_maria_app/core/domain/entities/login.entity.dart';
import 'package:tfg_maria_app/core/domain/value_objects/login_password.vo.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/dtos/schemas/login_dto.schema.dart';
import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/dtos/schemas/login_password_model_dto.schema.dart';
import 'package:tfg_maria_app/core/domain/value_objects/types.dart';

class LoginFactory {
  static LoginEntity entityFromSource(UID uid, Map<String, dynamic> source) {
    return LoginEntity(
      uid: uid,
      email: source[LoginDtoSchema.email],
      photoUrl: source[LoginDtoSchema.photoUrl],
      photoRelativePath: source[LoginDtoSchema.photoRelativePath],
      photoName: source[LoginDtoSchema.photoName],
      passwordModel: _entityFromSource(source[LoginDtoSchema.passwordModel]),
    );
  }

  static LoginPasswordVO _entityFromSource(Map<String, dynamic> source) {
    return LoginPasswordVO(
      photoUrl: source[LoginPasswordModelDtoSchema.photoUrl],
      passwordPiece: source[LoginPasswordModelDtoSchema.passwordPiece],
      photoRelativePath: source[LoginPasswordModelDtoSchema.photoRelativePath],
      photoName: source[LoginPasswordModelDtoSchema.photoName],
    );
  }
}
