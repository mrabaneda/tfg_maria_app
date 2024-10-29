import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';

final List<PlannerDayViewModel> weeklyPlanner = [
  PlannerDayViewModel(
    fullDay: 'Lunes 28 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Ir a dar un paseo',
        description: 'Sal a caminar por el parque cerca de casa.',
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Hacer la compra',
        description: 'Compra alimentos básicos en el supermercado.',
        taskFeedback: 2,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Martes 29 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Saludar a los vecinos',
        description: 'Visita a los vecinos y pregúntales cómo están.',
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Escuchar música',
        description: 'Dedica un tiempo a escuchar tus canciones favoritas.',
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Hacer un dibujo',
        description: 'Crea un dibujo de lo que más te guste.',
        taskFeedback: 2,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Miércoles 30 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Leer un libro',
        description: 'Elige un libro que te guste y léelo.',
        taskFeedback: 1,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Jueves 31 de octubre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Ver una película',
        description: 'Elige una película divertida para disfrutar.',
        taskFeedback: 2,
      ),
      PlannerDayItemViewModel(
        title: 'Preparar una merienda',
        description: 'Haz una merienda simple como un bocadillo.',
        taskFeedback: 1,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Viernes 1 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Visitar a un amigo',
        description: 'Pasa tiempo con un amigo en su casa.',
        taskFeedback: 2,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Sábado 2 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Hacer ejercicio',
        description: 'Realiza una actividad física ligera en casa.',
        taskFeedback: 1,
      ),
      PlannerDayItemViewModel(
        title: 'Cocinar una receta simple',
        description: 'Prepara una receta fácil, como una ensalada.',
        taskFeedback: 2,
      ),
      PlannerDayItemViewModel(
        title: 'Jugar a un juego de mesa',
        description: 'Disfruta de un juego de mesa con la familia.',
        taskFeedback: 2,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: 'Domingo 3 de noviembre de 2024',
    taskList: [
      PlannerDayItemViewModel(
        title: 'Pasar tiempo con la familia',
        description: 'Dedica tiempo a charlar o jugar con tu familia.',
        taskFeedback: 1,
      ),
    ],
  ),
];
