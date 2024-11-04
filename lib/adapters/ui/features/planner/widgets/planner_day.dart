import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_day_item.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class PlannerDay extends ConsumerWidget {
  final int dayIndex;

  const PlannerDay({
    super.key,
    required this.dayIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannerDays = ref.watch(plannerProvider.select((value) => value.plannerDays));
    final bool isDayCompleted = plannerDays[dayIndex].taskList.every((task) => task.isDone);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        fadeTransitionRoute(PlannerDayItem(dayIndex: dayIndex)),
      ),
      child: Container(
        padding: CommonTheme.defaultCardPadding,
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: isDayCompleted ? CommonTheme.successColor : CommonTheme.secondaryColorLight),
          borderRadius: BorderRadius.circular(wJM(3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(plannerDays[dayIndex].fullDay, style: CommonTheme.titleMedium),
            SizedBox(height: hJM(4.5)),
            Column(
              children: plannerDays[dayIndex].taskList.map((task) {
                return Column(
                  children: [
                    Row(
                      children: [
                        TaskStatusCheckbox(isChecked: task.isDone),
                        SizedBox(width: wJM(3)),
                        Text(task.title, style: CommonTheme.bodyMedium),
                      ],
                    ),
                    SizedBox(height: hJM(2)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
