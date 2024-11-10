class PlannerDayItemViewModel {
  final String title;
  final String description;
  final int taskFeedback;
  final bool isDone;

  PlannerDayItemViewModel({
    required this.title,
    required this.description,
    required this.taskFeedback,
    required this.isDone,
  });

  PlannerDayItemViewModel copyWith({
    String? title,
    String? description,
    bool? isDone,
    int? taskFeedback,
  }) {
    return PlannerDayItemViewModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      taskFeedback: taskFeedback ?? this.taskFeedback,
    );
  }
}
