import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/audio_preference_only_icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/audio_preference.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/image_preference.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/planner_task_item_feedback.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: wJM(3), vertical: hJM(2)),
      margin: EdgeInsets.symmetric(vertical: hJM(1), horizontal: wJM(3)),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: CommonTheme.secondaryColor),
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              TaskStatusCheckbox(isChecked: taskItem.isDone, dayIndex: dayIndex, taskIndex: taskIndex),
              SizedBox(width: wJM(3)),
              Text(taskItem.title, style: CommonTheme.titleMedium.copyWith(color: CommonTheme.statusBarColor)),
              Spacer(),
              AudioPreferenceOnlyIcon(text: '${taskItem.title},${taskItem.description}'),
            ],
          ),
          SizedBox(height: hJM(3)),
          _TaskDescription(description: taskItem.description, imageUrl: plannerDays[dayIndex].descriptionImagesUrls[taskIndex]),
          SizedBox(height: hJM(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagePreference(isVisible: taskItem.isDone),
              AudioPreference(text: '¡Muy bien, sigue así!', isVisible: taskItem.isDone),
            ],
          ),
          PlannerItemTaskFeedback(dayIndex: dayIndex, taskIndex: taskIndex, taskItem: taskItem, isVisible: taskItem.isDone),
        ],
      ),
    );
  }
}

class _TaskDescription extends StatelessWidget {
  final String description;
  final String imageUrl;

  const _TaskDescription({
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(wJM(2)),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: CommonTheme.primaryColor),
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: wJM(60),
            child: Text(description, style: CommonTheme.bodySmallStyle, maxLines: 3, overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            height: hJM(10),
            width: hJM(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(wJM(1)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (_, url) => Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: hJM(5),
                    width: hJM(5),
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
