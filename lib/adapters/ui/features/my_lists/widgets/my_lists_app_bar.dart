import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/widgets/create_list.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class MyListsAppBar extends StatelessWidget {
  const MyListsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text('Mis Listas', style: CommonTheme.titleSmall),
          const Spacer(),
          BaseButton(
            text: 'Crear Nueva Lista',
            textStyle: CommonTheme.bodySmall.copyWith(color: CommonTheme.backgroundColor),
            backgroundColor: CommonTheme.thirdColor,
            onClick: () => Navigator.push(context, fadeTransitionRoute(CreateList())),
          ),
          SizedBox(width: wJM(3)),
        ],
      ),
    );
  }
}
