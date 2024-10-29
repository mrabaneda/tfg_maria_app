import 'package:tfg_maria_app/core/domain/value_objects/login_password.vo.dart';
import 'package:tfg_maria_app/core/domain/value_objects/types.dart';

class LoginEntity {
  final UID uid;
  final String email;
  final String photoUrl;
  final String photoRelativePath;
  final String photoName;
  final List<LoginPasswordVO> passwordModel;

  LoginEntity({
    required this.uid,
    required this.email,
    required this.photoUrl,
    required this.photoRelativePath,
    required this.photoName,
    required this.passwordModel,
  });
}
