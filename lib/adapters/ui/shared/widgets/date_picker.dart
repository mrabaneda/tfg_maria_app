import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/utils.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/input.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final String placeHolder;
  final DateTime firstDate;
  final DateTime? lastDate;
  final bool enabled;
  final String? errorText;

  const DatePicker({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.placeHolder,
    required this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.errorText,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Input(
      textEditingController: widget.textEditingController,
      onTap: widget.enabled ? () => _onTap() : null,
      readOnly: true,
      isEnabled: widget.enabled,
      icon: Icons.calendar_month,
      label: widget.label,
      errorText: widget.errorText,
      placeHolder: widget.placeHolder,
      focusNode: _focusNode,
    );
  }

  Future<void> _onTap() async {
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final date = await showDatePicker(
        context: context,
        builder: (context, datePicker) {
          return Transform.scale(
            scale: 1.3,
            child: Container(
              padding: EdgeInsets.all(hJM(3)),
              height: hJM(65),
              width: wJM(70),
              child: Theme(
                data: context.theme.copyWith(
                  colorScheme: const ColorScheme.light().copyWith(primary: CommonTheme.primaryColorDark),
                  datePickerTheme: DatePickerThemeData(
                    headerHeadlineStyle: CommonTheme.titleSmall,
                    dayStyle: CommonTheme.bodyMedium,
                    yearStyle: CommonTheme.bodyMedium,
                    dividerColor: CommonTheme.dividerColor,
                    surfaceTintColor: Colors.transparent,
                    rangePickerBackgroundColor: CommonTheme.secondaryColorLight,
                    dayOverlayColor: WidgetStateProperty.all(CommonTheme.backgroundColor),
                    confirmButtonStyle: CommonTheme.datePickerButtonStyle,
                    cancelButtonStyle: CommonTheme.datePickerButtonStyle,
                    rangePickerHeaderHelpStyle: CommonTheme.bodySmall,
                  ),
                ),
                child: datePicker!,
              ),
            ),
          );
        },
        initialEntryMode: DatePickerEntryMode.calendar,
        cancelText: 'Cancelar',
        confirmText: 'Aceptar',
        helpText: 'Día seleccionado:',
        keyboardType: TextInputType.datetime,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate ?? today,
        currentDate: DateTime.now(),
      );
      if (date != null) {
        final dateFormat = DateFormat('EEEE d \'de\' MMMM \'de\' y', 'es_ES');
        final formattedDate = dateFormat.format(date);
        widget.textEditingController.text = formattedDate;
      }
      _focusNode.unfocus();
    } catch (_) {
      if (mounted) errorDialogBuilder(context);
    }
  }
}
