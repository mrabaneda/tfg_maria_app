import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/widgets/create_list_image_field.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
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
  XFile? _selectedTitleImage;
  XFile? _selectedItemImage;

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
                SizedBox(height: hJM(4)),
                CreateListImageField(
                  inputTitle: 'Selecciona la imagen para esta Lista',
                  selectedTitleImage: _selectedTitleImage,
                  isLoading: isLoading,
                ),
                SizedBox(height: hJM(8)),
                Input(
                  label: 'Descripción de la Lista',
                  placeHolder: 'Introduce la descripción de la lista',
                  icon: Icons.title_rounded,
                  textEditingController: _taskDescriptionController,
                  isEnabled: !isLoading,
                ),
                SizedBox(height: hJM(8)),
                CreateListImageField(
                  inputTitle: 'Selecciona la imagen para la Lista',
                  selectedTitleImage: _selectedItemImage,
                  isLoading: isLoading,
                ),
                SizedBox(height: hJM(15)),
                BaseButton(
                  text: 'Crear Lista',
                  backgroundColor: CommonTheme.secondaryColor,
                  onClick: () => {
                    ref.read(myListProvider.notifier).createList(
                      _taskTitleController.text,
                      sportsImage,
                      [
                        MyListItemViewModel(
                          description: 'Natación',
                          descriptionImagesUrl:
                              'https://globalsymbols.com/uploads/production/image/imagefile/22066/17_22067_92669f3c-137c-43c9-9980-81619ba7ebf6.png',
                        ),
                      ],
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
}
