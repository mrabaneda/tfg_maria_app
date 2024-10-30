import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_day_item_task.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class PlannerDayItem extends ConsumerWidget {
  final int dayIndex;

  const PlannerDayItem({
    super.key,
    required this.dayIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plannerDays = ref.watch(plannerProvider.select((value) => value.plannerDays));

    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: BaseAppBar(title: plannerDays[dayIndex].fullDay, back: true),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: plannerDays[dayIndex]
                  .taskList
                  .asMap()
                  .entries
                  .map(
                    (entry) => PlannerDayItemTask(dayIndex: dayIndex, taskIndex: entry.key),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
