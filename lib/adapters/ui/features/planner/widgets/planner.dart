import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_day.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';

class Planner extends ConsumerWidget {
  const Planner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekPlanner = ref.watch(plannerProvider.select((value) => value.plannerDays));
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: PlannerAppBar(),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: CommonTheme.defaultBodyPadding.copyWith(bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hoy es día: ${weekPlanner.elementAt(0).fullDay}', style: CommonTheme.bodyMedium),
                  SizedBox(height: hJM(3)),
                  SizedBox(
                    height: hJM(89),
                    child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weekPlanner.length,
                      itemBuilder: (_, index) => PlannerDay(dayIndex: index),
                      separatorBuilder: (_, __) => Divider(height: hJM(5), color: CommonTheme.dividerColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
