import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/frown.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/laugh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/meh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/smile.icon.dart';

class PlannerItemTaskFeedback extends ConsumerWidget {
  final int dayIndex;
  final int taskIndex;
  final PlannerDayItemViewModel taskItem;
  final bool isVisible;

  const PlannerItemTaskFeedback({
    super.key,
    required this.dayIndex,
    required this.taskIndex,
    required this.taskItem,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        width: wJM(99),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('¿Cómo me he sentido?', style: CommonTheme.bodySmall),
            Spacer(),
            GestureDetector(
              onTap: () => ref.read(plannerProvider.notifier).setFeedback(dayIndex, taskIndex, 1),
              child: FrownIcon(color: taskItem.taskFeedback == 1 ? CommonTheme.frownIconBackground : CommonTheme.statusBarColor),
            ),
            SizedBox(width: wJM(2)),
            GestureDetector(
              onTap: () => ref.read(plannerProvider.notifier).setFeedback(dayIndex, taskIndex, 2),
              child: MehIcon(color: taskItem.taskFeedback == 2 ? CommonTheme.mehIconBackground : CommonTheme.statusBarColor),
            ),
            SizedBox(width: wJM(2)),
            GestureDetector(
              onTap: () => ref.read(plannerProvider.notifier).setFeedback(dayIndex, taskIndex, 3),
              child: SmileIcon(color: taskItem.taskFeedback == 3 ? CommonTheme.smileIconBackground : CommonTheme.statusBarColor),
            ),
            SizedBox(width: wJM(2)),
            GestureDetector(
              onTap: () => ref.read(plannerProvider.notifier).setFeedback(dayIndex, taskIndex, 4),
              child: LaughIcon(color: taskItem.taskFeedback == 4 ? CommonTheme.laughIconBackground : CommonTheme.statusBarColor),
            ),
          ],
        ),
      ),
    );
  }
}
