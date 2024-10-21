import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/providers/global_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: CommonTheme.backgroundColor,
        border: Border.all(width: 0, color: Colors.transparent),
        boxShadow: CommonTheme.defaultAppBarboxShadow,
      ),
      height: CommonTheme.appBarHeight,
      child: Row(
        children: [
          SizedBox(width: wJM(3)),
          Image.asset(
            valeLogo,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            height: hJM(3),
          ),
          const Spacer(),
          Text(
            'Bienvenidx, ${ref.watch(globalControllerProvider.select((value) => value.authUser!.name))}',
            style: CommonTheme.titleSmall,
          ),
          SizedBox(width: wJM(3)),
        ],
      ),
    );
  }
}
