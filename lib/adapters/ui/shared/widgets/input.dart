import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class Input extends StatelessWidget {
  final bool isEnabled;
  final bool readOnly;
  final bool autoFocus;
  final bool hasErrorIcon;
  final TextInputAction textInputAction;
  final String? label;
  final int? maxLength;
  final IconData? icon;
  final String? errorText;
  final String? placeHolder;
  final IconData? errorIcon;
  final FocusNode? focusNode;
  final String? initialValue;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? textEditingController;

  const Input({
    super.key,
    this.isEnabled = true,
    this.readOnly = false,
    this.autoFocus = false,
    this.hasErrorIcon = true,
    this.textInputAction = TextInputAction.next,
    this.label,
    this.maxLength,
    this.icon,
    this.errorText,
    this.placeHolder,
    this.errorIcon,
    this.focusNode,
    this.initialValue,
    this.textStyle,
    this.onTap,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onFieldSubmitted,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null || label != null)
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: CommonTheme.primaryColor, size: hJM(4)),
                SizedBox(width: wJM(1.5)),
              ],
              if (label != null) Text(label!, style: CommonTheme.titleSmall),
            ],
          ),
        TextFormField(
          onTapOutside: (_) => focusNode?.unfocus(),
          initialValue: textEditingController == null ? initialValue : null,
          onTap: onTap,
          onChanged: onChanged,
          controller: initialValue == null ? textEditingController : null,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          autofocus: autoFocus,
          focusNode: focusNode,
          showCursor: !readOnly,
          enabled: isEnabled,
          readOnly: readOnly,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: 1,
          maxLength: maxLength,
          cursorColor: CommonTheme.primaryColor,
          textAlignVertical: TextAlignVertical.center,
          decoration: CommonTheme.inputDecoration.copyWith(
            label: Text(
              placeHolder ?? "",
              style: CommonTheme.bodyMedium.copyWith(color: CommonTheme.secondaryTextColor),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.only(top: 0, bottom: hJM(1), left: 0, right: 0),
            counterText: "",
          ),
          style: CommonTheme.bodyMedium,
        ),
        if (errorText?.isNotEmpty == true)
          Container(
            width: wJM(77),
            padding: EdgeInsets.only(top: hJM(1)),
            child: Row(
              children: [
                if (hasErrorIcon) ...[
                  Icon(errorIcon ?? Icons.error_outline_outlined, color: CommonTheme.errorColor, size: hJM(3)),
                  SizedBox(width: wJM(1.5)),
                ],
                Expanded(
                  child: Text(
                    errorText!,
                    style: CommonTheme.formErrorStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
