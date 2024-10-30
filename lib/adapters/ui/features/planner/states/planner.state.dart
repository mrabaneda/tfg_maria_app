import 'package:tfg_maria_app/adapters/ui/features/planner/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';

class PlannerState {
  final List<PlannerDayViewModel> plannerDays;

  PlannerState({required this.plannerDays});

  factory PlannerState.initial() => PlannerState(plannerDays: weeklyPlanner);

  PlannerState copyWith({
    List<PlannerDayViewModel>? plannerDays,
  }) {
    return PlannerState(
      plannerDays: plannerDays ?? this.plannerDays,
    );
  }
}
