import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';

final List<PlannerDayViewModel> weeklyPlanner = [
  PlannerDayViewModel(
    fullDay: 'Lunes 28 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Ir a dar un paseo',
        description: 'Sal a caminar por el parque cerca de casa.',
        isDone: true,
        taskFeedback: 2,
      ),
      PlannerDayItemViewModel(
        title: 'Hacer la compra',
        description: 'Compra alimentos básicos en el supermercado.',
        isDone: false,
        taskFeedback: 0,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Martes 29 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Saludar a los vecinos',
        description: 'Visita a los vecinos y pregúntales cómo están.',
        isDone: true,
        taskFeedback: 3,
      ),
      PlannerDayItemViewModel(
        title: 'Escuchar música',
        description: 'Dedica un tiempo a escuchar tus canciones favoritas.',
        isDone: false,
        taskFeedback: 0,
      ),
      PlannerDayItemViewModel(
        title: 'Hacer un dibujo',
        description: 'Crea un dibujo de lo que más te guste.',
        isDone: true,
        taskFeedback: 4,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Miércoles 30 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Leer un libro',
        description: 'Elige un libro que te guste y léelo.',
        isDone: false,
        taskFeedback: 0,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Jueves 31 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Ver una película',
        description: 'Elige una película divertida para disfrutar.',
        isDone: true,
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Preparar una merienda',
        description: 'Haz una merienda simple como un bocadillo.',
        isDone: false,
        taskFeedback: 0,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Viernes 1 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Visitar a un amigo',
        description: 'Pasa tiempo con un amigo en su casa.',
        isDone: true,
        taskFeedback: 4,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Sábado 2 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Hacer ejercicio',
        description: 'Realiza una actividad física ligera en casa.',
        isDone: false,
        taskFeedback: 0,
      ),
      PlannerDayItemViewModel(
        title: 'Cocinar una receta simple',
        description: 'Prepara una receta fácil, como una ensalada.',
        isDone: true,
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Jugar a un juego de mesa',
        description: 'Disfruta de un juego de mesa con la familia.',
        isDone: false,
        taskFeedback: 0,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Domingo 3 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Pasar tiempo con la familia',
        description: 'Dedica tiempo a charlar o jugar con tu familia.',
        isDone: true,
        taskFeedback: 2,
      ),
    ],
  ),
];
