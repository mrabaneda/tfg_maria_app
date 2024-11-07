import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';

class PlannerDayViewModel {
  final String fullDay;
  final List<PlannerDayItemViewModel> taskList;
  List<String> descriptionImagesUrls;

  PlannerDayViewModel({
    required this.fullDay,
    required this.taskList,
    required this.descriptionImagesUrls,
  });

  PlannerDayViewModel copyWith({
    String? fullDay,
    List<PlannerDayItemViewModel>? taskList,
    List<String>? descriptionImagesUrls,
  }) {
    return PlannerDayViewModel(
      fullDay: fullDay ?? this.fullDay,
      taskList: taskList ?? this.taskList,
      descriptionImagesUrls: descriptionImagesUrls ?? this.descriptionImagesUrls,
    );
  }
}
