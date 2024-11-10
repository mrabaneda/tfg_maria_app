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

    if (mounted) {
      state = state.copyWith(plannerDays: updatedDays);
    }
  }

  void setFeedback(int dayIndex, int taskIndex, int feedback) {
    final updatedDays = List<PlannerDayViewModel>.from(state.plannerDays);

    final updatedTasks = List<PlannerDayItemViewModel>.from(updatedDays[dayIndex].taskList);
    final currentFeedback = updatedTasks[taskIndex].taskFeedback;

    final newFeedback = (currentFeedback == feedback) ? 0 : feedback;

    updatedTasks[taskIndex] = updatedTasks[taskIndex].copyWith(taskFeedback: newFeedback);

    updatedDays[dayIndex] = updatedDays[dayIndex].copyWith(taskList: updatedTasks);

    if (mounted) {
      state = state.copyWith(plannerDays: updatedDays);
    }
  }

  Future<void> createTask(String taskDay, String taskImageUrl, PlannerDayItemViewModel newTask) async {
    try {
      if (state.asyncState.isLoading) return;

      if (mounted) {
        state = state.copyWith(asyncState: const AsyncLoading());
      }

      await Future.delayed(Duration(seconds: 3));

      if (taskDay.isEmpty) throw Exception('La fecha del día no puede estar vacía.');
      if (taskImageUrl.isEmpty) throw Exception('La URL de la imagen no puede estar vacía.');
      if (newTask.title.isEmpty || newTask.description.isEmpty) throw Exception('La tarea debe tener un título y una descripción.');
      if (newTask.isDone == true) throw Exception('La tarea no debe estar marcada como completada por defecto.');
      if (newTask.taskFeedback != -1) throw Exception('El feedback de la tarea debe ser inicializado correctamente.');

      int dayIndex = state.plannerDays.indexWhere((day) => day.fullDay.contains(taskDay));

      if (dayIndex == -1) {
        final newPlannerDay = PlannerDayViewModel(
          fullDay: taskDay,
          taskList: [newTask],
          descriptionImagesUrls: [taskImageUrl],
        );

        final updatedDays = List<PlannerDayViewModel>.from(state.plannerDays)..add(newPlannerDay);

        if (mounted) {
          state = state.copyWith(plannerDays: updatedDays, asyncState: const AsyncData(true));
        }
      } else {
        final updatedDays = List<PlannerDayViewModel>.from(state.plannerDays);
        final updatedTasks = List<PlannerDayItemViewModel>.from(updatedDays[dayIndex].taskList)..add(newTask);
        final updatedImages = List<String>.from(updatedDays[dayIndex].descriptionImagesUrls)..add(taskImageUrl);

        updatedDays[dayIndex] = updatedDays[dayIndex].copyWith(taskList: updatedTasks, descriptionImagesUrls: updatedImages);

        if (mounted) {
          state = state.copyWith(plannerDays: updatedDays, asyncState: const AsyncData(true));
        }
      }
    } on Exception catch (ex) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(ex, StackTrace.current));
    } catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    }
  }
}
