import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/planner_day.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class Planner extends StatelessWidget {
  const Planner({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const BaseAppBar(title: "Mi Agenda"),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: CommonTheme.defaultBodyPadding.copyWith(bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hoy es día: ${DateFormat.yMMMMd().format(DateTime.now())}', style: CommonTheme.bodyMedium),
                  SizedBox(height: wJM(4)),
                  SizedBox(
                    height: hJM(89),
                    child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weeklyPlanner.length,
                      itemBuilder: (_, index) {
                        return PlannerDay(plannerDay: weeklyPlanner[index]);
                      },
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
