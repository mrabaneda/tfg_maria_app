import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class TaskStatusCheckbox extends StatefulWidget {
  const TaskStatusCheckbox({super.key});

  @override
  State<TaskStatusCheckbox> createState() => _TaskStatusCheckboxState();
}

class _TaskStatusCheckboxState extends State<TaskStatusCheckbox> {
  bool _isChecked = false; // Estado del checkbox

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isChecked = !_isChecked),
      child: Container(
        width: wJM(5.5),
        height: wJM(5.5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _isChecked ? CommonTheme.primaryColor : Colors.grey,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                color: CommonTheme.primaryColorDark,
                size: hJM(3),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
