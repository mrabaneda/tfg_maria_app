import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class CreateTaskWeekday extends ConsumerWidget {
  final TextEditingController textEditingController;

  const CreateTaskWeekday({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekDays = ref.watch(plannerProvider.select((value) => value.plannerDays.map((days) => days.fullDay).toList()));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.date_range_rounded, color: CommonTheme.primaryColor, size: hJM(4)),
            SizedBox(width: wJM(1.5)),
            Text('Fecha de la Tarea', style: CommonTheme.titleSmall),
          ],
        ),
        SizedBox(height: hJM(2)),
        _CreateTaskSelectDate(weekDays: weekDays, textEditingController: textEditingController),
      ],
    );
  }
}

class _CreateTaskSelectDate extends StatefulWidget {
  final List<String> weekDays;
  final TextEditingController textEditingController;

  const _CreateTaskSelectDate({
    required this.weekDays,
    required this.textEditingController,
  });

  @override
  _CreateTaskSelectDateState createState() => _CreateTaskSelectDateState();
}

class _CreateTaskSelectDateState extends State<_CreateTaskSelectDate> {
  int? selectedIndex;

  void _onDaySelected(int index) {
    setState(() {
      selectedIndex = index;
      widget.textEditingController.text = widget.weekDays[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: wJM(2),
      runSpacing: wJM(2),
      children: List.generate(widget.weekDays.length, (index) {
        return BaseButton(
          text: widget.weekDays[index].split(' ')[0],
          textStyle: CommonTheme.bodyMedium.copyWith(
            color: selectedIndex == index ? CommonTheme.backgroundColor : CommonTheme.statusBarColor,
          ),
          backgroundColor: selectedIndex == index ? CommonTheme.secondaryColorLight : CommonTheme.backgroundColor,
          borderColor: CommonTheme.secondaryColor,
          onClick: () => _onDaySelected(index),
        );
      }).toList(),
    );
  }
}
