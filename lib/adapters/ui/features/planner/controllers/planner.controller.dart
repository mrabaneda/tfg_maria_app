import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/states/planner.state.dart';

class PlannerController extends StateNotifier<PlannerState> {
  PlannerController() : super(PlannerState.initial());

  void setIsDone(int dayIndex, int taskIndex, bool isDone) {
    final updatedDays = List<PlannerDayViewModel>.from(state.plannerDays);

    final updatedTasks = List<PlannerDayItemViewModel>.from(updatedDays[dayIndex].taskList);
    updatedTasks[taskIndex] = updatedTasks[taskIndex].copyWith(isDone: isDone);

    updatedDays[dayIndex] = updatedDays[dayIndex].copyWith(taskList: updatedTasks);

    state = state.copyWith(plannerDays: updatedDays);
  }

  void setFeedback(int dayIndex, int taskIndex, int feedback) {
    final updatedDays = List<PlannerDayViewModel>.from(state.plannerDays);

    final updatedTasks = List<PlannerDayItemViewModel>.from(updatedDays[dayIndex].taskList);
    updatedTasks[taskIndex] = updatedTasks[taskIndex].copyWith(taskFeedback: feedback);

    updatedDays[dayIndex] = updatedDays[dayIndex].copyWith(taskList: updatedTasks);

    state = state.copyWith(plannerDays: updatedDays);
  }
}
