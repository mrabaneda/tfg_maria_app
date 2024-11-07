import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/audio_preference.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/image_preference.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/frown.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/laugh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/meh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/smile.icon.dart';

class PlannerDayItemTask extends ConsumerWidget {
  final int dayIndex;
  final int taskIndex;

  const PlannerDayItemTask({
    super.key,
    required this.dayIndex,
    required this.taskIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannerDays = ref.watch(plannerProvider.select((value) => value.plannerDays));
    final taskItem = plannerDays[dayIndex].taskList[taskIndex];
    return Padding(
      padding: CommonTheme.defaultBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TaskStatusCheckbox(isChecked: taskItem.isDone, dayIndex: dayIndex, taskIndex: taskIndex),
              SizedBox(width: wJM(3)),
              Text(taskItem.title, style: CommonTheme.titleMedium.copyWith(color: CommonTheme.statusBarColor)),
            ],
          ),
          SizedBox(height: hJM(3)),
          _TaskDescription(description: taskItem.description),
          SizedBox(height: hJM(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePreference(isVisible: taskItem.isDone),
              AudioPreference(text: '¡Bien hecho! ¡Eres la mejor!', isVisible: taskItem.isDone),
            ],
          ),
          SizedBox(
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
          SizedBox(height: hJM(2)),
          Divider(color: CommonTheme.dividerColor),
        ],
      ),
    );
  }
}

class _TaskDescription extends StatelessWidget {
  final String description;

  const _TaskDescription({
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(wJM(2)),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: CommonTheme.primaryColor),
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: CommonTheme.bodySmallStyle),
          SizedBox(height: hJM(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.attach_file_rounded, size: hJM(3.5), color: CommonTheme.secondaryColor),
              SizedBox(width: wJM(3)),
              Icon(Icons.photo_rounded, size: hJM(3.5), color: CommonTheme.secondaryColor),
            ],
          )
        ],
      ),
    );
  }
}
