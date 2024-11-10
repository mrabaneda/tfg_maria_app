import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';

class ImagePreference extends StatelessWidget {
  final bool isVisible;

  const ImagePreference({
    super.key,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        children: [
          Image.asset(
            successImagePreference,
            alignment: Alignment.center,
            height: hJM(13),
            fit: BoxFit.contain,
          ),
          SizedBox(height: hJM(3)),
        ],
      ),
    );
  }
}
