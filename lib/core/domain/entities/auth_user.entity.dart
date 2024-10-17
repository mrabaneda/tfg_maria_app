import 'package:tfg_maria_app/core/domain/value_objects/types.dart';

class AuthUserEntity {
  final UID uid;
  final String name;
  final String email;
  final String photoUrl;

  AuthUserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
  });
}
