import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class PlannerDay extends StatelessWidget {
  final PlannerDayViewModel plannerDay;

  const PlannerDay({super.key, required this.plannerDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonTheme.defaultCardPadding,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: CommonTheme.statusBarColor),
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plannerDay.fullDay, style: CommonTheme.titleMedium),
          SizedBox(height: hJM(4.5)),
          Column(
            children: plannerDay.taskList.map((task) {
              return Column(
                children: [
                  Row(
                    children: [
                      TaskStatusCheckbox(),
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
    );
  }
}
