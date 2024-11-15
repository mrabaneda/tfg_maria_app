import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/models/login_password.model.dart';
import 'package:tfg_maria_app/adapters/ui/features/auth/sign_in/providers/sign_in_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class SignInPassword extends ConsumerStatefulWidget {
  final List<LoginPasswordModel> loginPasswords;
  final String selectedEmail;

  const SignInPassword({
    super.key,
    required this.loginPasswords,
    required this.selectedEmail,
  });

  @override
  ConsumerState<SignInPassword> createState() => _SignInPasswordstate();
}

class _SignInPasswordstate extends ConsumerState<SignInPassword> {
  int selectedItem = -1;
  bool isWrongPassword = false;
  List<String> selectedPassword = [];

  @override
  Widget build(BuildContext context) {
    ref.listen(
      signInControllerProvider.select((value) => value.asyncState),
      (_, asyncValue) {
        if (asyncValue.isError) {
          // errorDialogBuilder(context, asyncValue.error.toString());
          setState(() => isWrongPassword = true);
        }
        if (asyncValue.isDone && Navigator.of(context).canPop()) {
          Navigator.pop(context, false);
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: BaseAppBar(title: "Inicio de sesión", back: true),
          child: Padding(
            padding: EdgeInsets.all(hJM(3)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Selecciona tu contraseña en el orden correspondiente:', style: CommonTheme.titleSmall),
                SizedBox(
                  height: hJM(74),
                  child: GridView.builder(
                    padding: EdgeInsets.all(hJM(3)),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: widget.loginPasswords.length,
                    itemBuilder: (_, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  String passwordString = widget.loginPasswords[index].passwordPiece;
                                  if (isWrongPassword) {
                                    isWrongPassword = false;
                                  }
                                  selectedPassword.contains(passwordString)
                                      ? selectedPassword.remove(passwordString)
                                      : selectedPassword.add(passwordString);
                                },
                              );
                            },
                            child: Container(
                              height: hJM(40),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedPassword.contains(widget.loginPasswords[index].passwordPiece)
                                      ? CommonTheme.secondaryColor
                                      : CommonTheme.unselectedColor,
                                  width: selectedPassword.contains(widget.loginPasswords[index].passwordPiece) ? 6.0 : 2.0,
                                ),
                                borderRadius: BorderRadius.circular(wJM(3)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(wJM(2)),
                                child: CachedNetworkImage(
                                  imageUrl: widget.loginPasswords[index].photoUrl,
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
                          ),
                          if (selectedPassword.contains(widget.loginPasswords[index].passwordPiece))
                            Positioned(
                              top: hJM(1),
                              right: hJM(1),
                              child: Container(
                                width: wJM(5),
                                height: wJM(5),
                                decoration: BoxDecoration(
                                  color: CommonTheme.secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${selectedPassword.indexOf(widget.loginPasswords[index].passwordPiece) + 1}',
                                    style: CommonTheme.titleSmallLightStyle,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: isWrongPassword,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CommonTheme.secondaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(wJM(3)),
                    ),
                    child: Padding(
                      padding: CommonTheme.defaultPadding,
                      child: Row(
                        children: [
                          SizedBox(
                            width: wJM(45),
                            child: Text(
                              'Ups, parece que este no es el orden correcto! Prueba otra vez por favor.',
                              maxLines: 3,
                              style: CommonTheme.bodySmall,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            doubtImage,
                            alignment: Alignment.center,
                            height: hJM(12),
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: wJM(2)),
                          Image.asset(
                            tryAgainImage,
                            alignment: Alignment.center,
                            height: hJM(12),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: hJM(3)),
                BaseButton(
                  backgroundColor: CommonTheme.secondaryColor,
                  width: wJM(50),
                  text: "Iniciar sesión",
                  isEnabled: selectedPassword.length == 4,
                  loading: ref.watch(signInControllerProvider.select((value) => value.asyncState.isLoading)),
                  onClick: () async {
                    ref.read(signInControllerProvider.notifier).setEmail(widget.selectedEmail);
                    ref.read(signInControllerProvider.notifier).setPassword(selectedPassword.join());
                    await ref.read(signInControllerProvider.notifier).signIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
