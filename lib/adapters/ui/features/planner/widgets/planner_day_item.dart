import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_day_item_task.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class PlannerDayItem extends StatelessWidget {
  final PlannerDayViewModel plannerDayItem;

  const PlannerDayItem({super.key, required this.plannerDayItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: BaseAppBar(title: plannerDayItem.fullDay, back: true),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: plannerDayItem.taskList
                  .map(
                    (task) => PlannerDayItemTask(taskItem: task),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
