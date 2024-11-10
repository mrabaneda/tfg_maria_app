import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';

final List<PlannerDayViewModel> weeklyPlanner = [
  PlannerDayViewModel(
    fullDay: '',
    descriptionImagesUrls: [toWalkImage, goShoppingImage],
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
    fullDay: '',
    descriptionImagesUrls: [toVisitImage, listenToMusicImage, paintImage],
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
        isDone: true,
        taskFeedback: 4,
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
    fullDay: '',
    descriptionImagesUrls: [toReadImage],
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
    fullDay: '',
    descriptionImagesUrls: [watchMovieImage, snackImage, familyImage],
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
      PlannerDayItemViewModel(
        title: 'Pasar tiempo con la familia',
        description: 'Dedica tiempo a charlar o jugar con tu familia.',
        isDone: true,
        taskFeedback: 2,
      ),
    ],
  ),
  PlannerDayViewModel(
    fullDay: '',
    descriptionImagesUrls: [friendsImage],
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
    fullDay: '',
    descriptionImagesUrls: [playSportsImage, toCookImage, boardGameImage],
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
    descriptionImagesUrls: [familyImage],
    fullDay: '',
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

const friendsImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/amigos.png";
const toWalkImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/caminar.png";
const toCookImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/cocinar.png";
const paintImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/dibujar.png";
const listenToMusicImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/escuchar%20m%C3%BAsica.png";
const familyImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/familia.png";
const playSportsImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/hacer%20ejercicio.png";
const goShoppingImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/hacer%20la%20compra.png";
const boardGameImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/juego%20de%20mesa.png";
const toReadImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/leer.png";
const snackImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/merienda.png";
const watchMovieImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/ver%20una%20pel%C3%ADcula.png";
const toVisitImage = "https://storage.googleapis.com/tfg-maria-14cce.appspot.com/tasks_images/visitar.png";
