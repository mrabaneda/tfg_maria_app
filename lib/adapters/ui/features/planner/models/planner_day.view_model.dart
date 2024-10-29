import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';

class PlannerDayViewModel {
  final String fullDay;
  final List<PlannerDayItemViewModel> taskList;

  PlannerDayViewModel({
    required this.fullDay,
    required this.taskList,
  });
}
