import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login.model.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/providers/login_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class SignInList extends ConsumerStatefulWidget {
  final List<LoginModel> logins;

  const SignInList({
    super.key,
    required this.logins,
  });

  @override
  ConsumerState<SignInList> createState() => _SignInListstate();
}

class _SignInListstate extends ConsumerState<SignInList> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: wJM(3)),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: widget.logins.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() => selectedItem == index ? selectedItem = -1 : selectedItem = index);
            ref.read(loginControllerProvider.notifier).setLoginIndex(selectedItem);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedItem == index ? CommonTheme.secondaryColor : CommonTheme.unselectedColor,
                width: selectedItem == index ? 6.0 : 2.0,
              ),
              borderRadius: BorderRadius.circular(wJM(3)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(wJM(2.5)),
              child: CachedNetworkImage(
                imageUrl: widget.logins[index].photoUrl,
                placeholder: (_, url) => Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: hJM(8),
                    width: hJM(8),
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
