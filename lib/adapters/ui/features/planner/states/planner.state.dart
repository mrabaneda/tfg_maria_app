import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';

class PlannerState {
  final AsyncValue<bool> asyncState;
  final List<PlannerDayViewModel> plannerDays;

  PlannerState({
    required this.asyncState,
    required this.plannerDays,
  });

  factory PlannerState.initial() => PlannerState(
        asyncState: const AsyncData(false),
        plannerDays: _generateWeekPlanner(),
      );

  static List<PlannerDayViewModel> _generateWeekPlanner() {
    final now = DateTime.now();
    final days = <PlannerDayViewModel>[];
    final currentDayIndex = now.weekday - 1;
    final dateFormat = DateFormat('EEEE d \'de\' MMMM \'de\' y', 'es_ES');

    for (int i = 0; i < weeklyPlanner.length; i++) {
      final weekDayIndex = (currentDayIndex + i) % weeklyPlanner.length;
      final date = now.add(Duration(days: i));
      final dayName = dateFormat.format(date);
      days.add(
        PlannerDayViewModel(
          fullDay: dayName,
          taskList: weeklyPlanner[weekDayIndex].taskList,
          descriptionImagesUrls: weeklyPlanner[weekDayIndex].descriptionImagesUrls,
        ),
      );
    }
    return days;
  }

  PlannerState copyWith({
    AsyncValue<bool>? asyncState,
    List<PlannerDayViewModel>? plannerDays,
  }) {
    return PlannerState(
      asyncState: asyncState ?? this.asyncState,
      plannerDays: plannerDays ?? this.plannerDays,
    );
  }
}
