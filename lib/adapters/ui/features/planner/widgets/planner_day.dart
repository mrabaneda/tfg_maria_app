import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/planner_day_item.dart';
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
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: hJM(2)),
            padding: CommonTheme.defaultCardPadding,
            decoration: BoxDecoration(
              border: Border.all(width: 5.0, color: isDayCompleted ? CommonTheme.successColor : CommonTheme.secondaryColorLight),
              borderRadius: BorderRadius.circular(wJM(3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plannerDays[dayIndex].fullDay, style: CommonTheme.titleMedium),
                SizedBox(height: hJM(4.5)),
                Column(
                  children: plannerDays[dayIndex].taskList.map(
                    (task) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              TaskStatusCheckbox(isChecked: task.isDone, isStatusChangeWanted: false),
                              SizedBox(width: wJM(3)),
                              Text(task.title, style: CommonTheme.bodyMedium),
                            ],
                          ),
                          SizedBox(height: hJM(2)),
                        ],
                      );
                    },
                  ).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: plannerDays[dayIndex].descriptionImagesUrls.map(
                    (imageUrl) {
                      return SizedBox(
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
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: wJM(6.5),
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                9,
                (index) {
                  return Container(
                    width: wJM(2),
                    height: hJM(3.3),
                    margin: EdgeInsets.only(right: wJM(7.5)),
                    decoration: BoxDecoration(
                      color: CommonTheme.secondaryTextColor,
                      border: Border.all(color: CommonTheme.secondaryTextColor, width: 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
