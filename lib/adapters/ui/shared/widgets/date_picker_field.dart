import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/date_picker.dart';

class DatePickerField extends StatefulWidget {
  final String label;
  final String placeHolder;
  final String errorText;
  final bool isEnabled;
  final TextEditingController textEditingController;
  final void Function() resetError;
  final DateTime firstDate;
  final DateTime? lastDate;

  const DatePickerField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.errorText,
    required this.textEditingController,
    required this.isEnabled,
    required this.resetError,
    required this.firstDate,
    this.lastDate,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late bool showClearButton;

  @override
  void initState() {
    super.initState();
    showClearButton = widget.textEditingController.text.isNotEmpty;
    widget.textEditingController.addListener(_updateClearButtonVisibility);
  }

  @override
  void dispose() {
    widget.textEditingController.removeListener(_updateClearButtonVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: widget.errorText.isNotEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        Expanded(
          child: DatePicker(
            label: widget.label,
            placeHolder: widget.placeHolder,
            enabled: widget.isEnabled,
            errorText: widget.errorText,
            textEditingController: widget.textEditingController,
            lastDate: widget.lastDate,
            firstDate: widget.firstDate,
          ),
        ),
        Visibility(
          visible: showClearButton,
          child: BaseButton(
            width: wJM(14),
            height: hJM(6),
            padding: EdgeInsets.only(left: wJM(2)),
            icon: Icon(Icons.close_rounded, size: hJM(4), color: CommonTheme.primaryColor),
            progressIndicatorColor: CommonTheme.primaryColor,
            backgroundColor: CommonTheme.backgroundColor,
            onClick: _onClick,
            isEnabled: widget.isEnabled,
            preserveColorWhenDisabled: true,
          ),
        ),
      ],
    );
  }

  void _onClick() {
    if (!mounted) return;
    widget.textEditingController.clear();
    widget.resetError; // TODO: logic here?
  }

  void _updateClearButtonVisibility() {
    if (!mounted) return;
    setState(() {
      showClearButton = widget.textEditingController.text.isNotEmpty;
    });
  }
}
