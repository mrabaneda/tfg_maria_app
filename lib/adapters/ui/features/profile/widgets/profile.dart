import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/providers/global_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(globalControllerProvider.select((value) => value.authUser));

    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const BaseAppBar(title: "Mi perfil"),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: hJM(4)),
                SizedBox(
                  height: hJM(35),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(wJM(3)),
                    child: CachedNetworkImage(
                      imageUrl: user?.photoUrl ??
                          "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/user_images/lucia12/5d3a3ab7-3138-4b45-a364-7f02361cafd6.png",
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
                SizedBox(height: hJM(5)),
                Text(user?.name ?? "María Rabaneda Sierra", style: CommonTheme.titleMedium),
                SizedBox(height: hJM(10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Mis preferencias:', style: CommonTheme.bodyMedium),
                    SizedBox(width: wJM(5)),
                    Column(
                      children: [
                        BaseButton(
                          text: 'Audio',
                          textStyle: CommonTheme.bodyMediumLightStyle,
                          backgroundColor: CommonTheme.secondaryColorLight,
                        ),
                        SizedBox(height: hJM(2)),
                        BaseButton(
                          text: 'Imágenes',
                          textStyle: CommonTheme.bodyMediumLightStyle,
                          backgroundColor: CommonTheme.thirdColorLight,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
