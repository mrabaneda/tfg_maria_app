import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:tfg_maria_app/adapters/ui/features/planner/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/create_task/create_task_weekday.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/input.dart';

class CreateTask extends ConsumerStatefulWidget {
  const CreateTask({super.key});

  @override
  ConsumerState<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _selectedDate = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(plannerProvider.select((value) => value.asyncState.isLoading));
    ref.listen(
      plannerProvider.select((value) => value.asyncState),
      (_, asyncValue) {
        if (asyncValue.isError) {
          errorDialogBuilder(context, asyncValue.error.toString());
        }
        if (asyncValue.isDone && Navigator.of(context).canPop()) {
          Navigator.pop(context, false);
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: BaseAppBar(title: 'Crear una nueva Tarea', back: true),
          child: Padding(
            padding: CommonTheme.defaultBodyPadding.copyWith(bottom: 0.0),
            child: ListView(
              children: [
                CreateTaskWeekday(textEditingController: _selectedDate),
                SizedBox(height: hJM(4)),
                Input(
                  label: 'Título de la tarea',
                  placeHolder: 'Introduce el título de la tarea',
                  icon: Icons.title_rounded,
                  textEditingController: _taskTitleController,
                  isEnabled: !isLoading,
                ),
                SizedBox(height: hJM(4)),
                Input(
                  label: 'Descripción de la tarea',
                  placeHolder: 'Introduce la descripción de la tarea',
                  icon: Icons.title_rounded,
                  textEditingController: _taskDescriptionController,
                  isEnabled: !isLoading,
                ),
                SizedBox(height: hJM(4)),
                Text('Imagen de la tarea', style: CommonTheme.titleSmall),
                SizedBox(height: hJM(2)),
                GestureDetector(
                  onTap: isLoading ? null : _selectPhoto,
                  child: Container(
                    height: hJM(18),
                    padding: EdgeInsets.all(wJM(2)),
                    decoration: BoxDecoration(
                      border: Border.all(color: CommonTheme.primaryColor),
                      borderRadius: CommonTheme.defaultCardRadius,
                    ),
                    child: _selectedImage == null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.photo, size: hJM(5), color: CommonTheme.primaryColor),
                                SizedBox(height: 8),
                                Text('Selecciona una imagen para la tarea', style: CommonTheme.bodySmall),
                              ],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(wJM(2)),
                            child: Image.file(
                              File(_selectedImage!.path),
                              fit: BoxFit.contain,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: hJM(8)),
                BaseButton(
                  text: 'Crear tarea',
                  backgroundColor: CommonTheme.secondaryColor,
                  loading: isLoading,
                  onClick: () => {
                    ref.read(plannerProvider.notifier).createTask(
                          _selectedDate.value.text,
                          playSportsImage,
                          PlannerDayItemViewModel(
                            title: _taskTitleController.text,
                            description: _taskDescriptionController.text,
                            isDone: false,
                            taskFeedback: -1,
                          ),
                        ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectPhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (photo != null) {
      setState(() => _selectedImage = photo);
    }
  }
}
