import 'package:tfg_maria_app/adapters/infrastructure/frameworks/firestore/dtos/login_password_model.dto.dart';

class LoginDto {
  final String email;
  final String photoName;
  final String photoRelativePath;
  final String photoUrl;
  final LoginPasswordModelDto passwordModel;

  LoginDto({
    required this.email,
    required this.photoName,
    required this.photoRelativePath,
    required this.photoUrl,
    required this.passwordModel,
  });
}
