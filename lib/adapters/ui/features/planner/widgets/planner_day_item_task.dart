import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/models/planner_day_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/frown.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/laugh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/meh.icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/icons/smile.icon.dart';

class PlannerDayItemTask extends StatefulWidget {
  final PlannerDayItemViewModel taskItem;

  const PlannerDayItemTask({super.key, required this.taskItem});

  @override
  State<PlannerDayItemTask> createState() => _PlannerDayItemTask();
}

class _PlannerDayItemTask extends State<PlannerDayItemTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonTheme.defaultBodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TaskStatusCheckbox(isChecked: widget.taskItem.isDone),
              SizedBox(width: wJM(3)),
              Text(widget.taskItem.title, style: CommonTheme.titleSmall),
            ],
          ),
          SizedBox(height: hJM(3)),
          _TaskDescription(description: widget.taskItem.description),
          SizedBox(height: hJM(3)),
          SizedBox(
            width: wJM(99),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('¿Cómo me he sentido?', style: CommonTheme.bodyMedium),
                Spacer(),
                FrownIcon(color: widget.taskItem.taskFeedback == 1 ? CommonTheme.frownIconBackground : CommonTheme.statusBarColor),
                SizedBox(width: wJM(2)),
                MehIcon(color: widget.taskItem.taskFeedback == 2 ? CommonTheme.mehIconBackground : CommonTheme.statusBarColor),
                SizedBox(width: wJM(2)),
                SmileIcon(color: widget.taskItem.taskFeedback == 3 ? CommonTheme.smileIconBackground : CommonTheme.statusBarColor),
                SizedBox(width: wJM(2)),
                LaughIcon(color: widget.taskItem.taskFeedback == 4 ? CommonTheme.laughIconBackground : CommonTheme.statusBarColor),
              ],
            ),
          ),
          SizedBox(height: hJM(3)),
          Divider(color: CommonTheme.dividerColor),
        ],
      ),
    );
  }
}

class _TaskDescription extends StatelessWidget {
  final String description;

  const _TaskDescription({
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonTheme.defaultCardPadding,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: CommonTheme.statusBarColor),
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: CommonTheme.bodySmallStyle),
          SizedBox(height: hJM(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.attach_file_rounded, size: hJM(3.5), color: CommonTheme.secondaryColor),
              SizedBox(width: wJM(3)),
              Icon(Icons.photo_rounded, size: hJM(3.5), color: CommonTheme.secondaryColor),
            ],
          )
        ],
      ),
    );
  }
}
