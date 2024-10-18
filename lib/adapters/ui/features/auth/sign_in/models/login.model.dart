import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login_password.model.dart';

class LoginModel {
  final String email;
  final String photoUrl;
  final String photoRelativePath;
  final String photoName;
  final LoginPasswordModel passwordModel;

  LoginModel({
    required this.email,
    required this.photoUrl,
    required this.photoRelativePath,
    required this.photoName,
    required this.passwordModel,
  });
}
