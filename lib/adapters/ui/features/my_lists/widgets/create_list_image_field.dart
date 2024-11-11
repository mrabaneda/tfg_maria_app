import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class CreateListImageField extends StatefulWidget {
  final String inputTitle;
  final XFile? selectedTitleImage;
  final bool isLoading;

  const CreateListImageField({
    super.key,
    required this.inputTitle,
    required this.selectedTitleImage,
    required this.isLoading,
  });

  @override
  State<CreateListImageField> createState() => _CreateListImageFieldState();
}

class _CreateListImageFieldState extends State<CreateListImageField> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedTitleImage;

  @override
  void initState() {
    super.initState();
    _selectedTitleImage = widget.selectedTitleImage;
  }

  Future<void> _selectPhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (photo != null) {
      setState(() => _selectedTitleImage = photo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.inputTitle, style: CommonTheme.titleSmall),
        SizedBox(height: hJM(2)),
        GestureDetector(
          onTap: widget.isLoading ? null : _selectPhoto,
          child: Container(
            height: hJM(13),
            padding: EdgeInsets.all(wJM(2)),
            decoration: BoxDecoration(
              border: Border.all(color: CommonTheme.primaryColor),
              borderRadius: CommonTheme.defaultCardRadius,
            ),
            child: _selectedTitleImage == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo, size: hJM(5), color: CommonTheme.primaryColor),
                        SizedBox(height: 8),
                        Text('Selecciona las imágenes que quieres', style: CommonTheme.bodySmall),
                      ],
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(wJM(2)),
                    child: Image.file(
                      File(_selectedTitleImage!.path),
                      fit: BoxFit.contain,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
