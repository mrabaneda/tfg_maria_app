import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class TaskStatusCheckbox extends ConsumerStatefulWidget {
  final bool isChecked;
  final int? dayIndex;
  final int? taskIndex;

  const TaskStatusCheckbox({
    super.key,
    required this.isChecked,
    this.dayIndex,
    this.taskIndex,
  });

  @override
  ConsumerState<TaskStatusCheckbox> createState() => _TaskStatusCheckboxState();
}

class _TaskStatusCheckboxState extends ConsumerState<TaskStatusCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _isChecked = !_isChecked;
        if (widget.dayIndex != null && widget.taskIndex != null) {
          ref.read(plannerProvider.notifier).setIsDone(widget.dayIndex!, widget.taskIndex!, _isChecked);
        }
      }),
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
