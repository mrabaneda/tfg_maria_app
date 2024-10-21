import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login.model.dart';

class SignInItem extends StatelessWidget {
  final List<LoginModel> logins;

  const SignInItem({
    super.key,
    required this.logins,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: logins.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: logins[index].photoUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
