import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/create_task/create_task.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class PlannerAppBar extends ConsumerWidget {
  const PlannerAppBar({super.key});

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
          Text('Mi Agenda', style: CommonTheme.titleSmall),
          const Spacer(),
          BaseButton(
            text: 'Crear Nueva Tarea',
            textStyle: CommonTheme.bodySmall.copyWith(color: CommonTheme.backgroundColor),
            backgroundColor: CommonTheme.thirdColor,
            onClick: () => Navigator.push(context, fadeTransitionRoute(CreateTask())),
          ),
          SizedBox(width: wJM(3)),
        ],
      ),
    );
  }
}
