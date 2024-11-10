import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/providers/planner_controller.provider.dart';

import 'package:tfg_maria_app/adapters/ui/features/planner/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/input.dart';

class CreateList extends ConsumerStatefulWidget {
  const CreateList({super.key});

  @override
  ConsumerState<CreateList> createState() => _CreateListState();
}

class _CreateListState extends ConsumerState<CreateList> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(myListProvider.select((value) => value.asyncState.isLoading));
    ref.listen(
      myListProvider.select((value) => value.asyncState),
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
          appBar: BaseAppBar(title: 'Crear una nueva Lista', back: true),
          child: Padding(
            padding: CommonTheme.defaultBodyPadding,
            child: ListView(
              children: [
                Input(
                  label: 'Título de la Lista',
                  placeHolder: 'Introduce el título de la lista',
                  icon: Icons.title_rounded,
                  textEditingController: _taskTitleController,
                  isEnabled: !isLoading,
                ),
                SizedBox(height: hJM(9)),
                Input(
                  label: 'Descripción de la Lista',
                  placeHolder: 'Introduce la descripción de la lista',
                  icon: Icons.title_rounded,
                  textEditingController: _taskDescriptionController,
                  isEnabled: !isLoading,
                ),
                SizedBox(height: hJM(9)),
                Text('Imágenes de la Lista', style: CommonTheme.titleSmall),
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
                                Text('Selecciona las imágenes para esta lista', style: CommonTheme.bodySmall),
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
                SizedBox(height: hJM(15)),
                BaseButton(
                  text: 'Crear Lista',
                  backgroundColor: CommonTheme.secondaryColor,
                  onClick: () => {
                    ref.read(myListProvider.notifier).createList(
                      _taskTitleController.text,
                      _taskDescriptionController.text,
                      [playSportsImage, boardGameImage],
                    ),
                  },
                  loading: isLoading,
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
