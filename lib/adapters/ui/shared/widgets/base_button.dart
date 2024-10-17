import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class BaseButton extends StatelessWidget {
  final void Function()? onClick;
  final bool loading;
  final bool isEnabled;
  final bool preserveColorWhenDisabled;
  final BorderRadius borderRadius;
  final int maxLines;
  final String? text;
  final Icon? icon;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? buttonTextColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Color? progressIndicatorColor;

  const BaseButton({
    super.key,
    this.onClick,
    this.loading = false,
    this.isEnabled = true,
    this.preserveColorWhenDisabled = false,
    this.borderRadius = CommonTheme.defaultButtonRadius,
    this.maxLines = 1,
    this.text,
    this.icon,
    this.height,
    this.width,
    this.textStyle,
    this.borderColor,
    this.buttonTextColor,
    this.backgroundColor,
    this.padding,
    this.progressIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onClick : null,
      child: Container(
        height: height ?? CommonTheme.defaultButtonHeight,
        width: width ?? CommonTheme.defaultButtonWidth,
        padding: padding ?? CommonTheme.defaultButtonPadding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: preserveColorWhenDisabled
                ? (borderColor ?? backgroundColor ?? CommonTheme.backgroundColor)
                : (isEnabled ? (borderColor ?? backgroundColor ?? CommonTheme.backgroundColor) : CommonTheme.disabledColor),
          ),
          color: preserveColorWhenDisabled
              ? (backgroundColor ?? CommonTheme.backgroundColor)
              : isEnabled
                  ? (backgroundColor ?? CommonTheme.backgroundColor)
                  : CommonTheme.disabledColor,
        ),
        child: Visibility(
          visible: loading,
          replacement: Row(
            mainAxisAlignment: (icon != null && text == null) ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              if (icon != null) icon!,
              if (icon != null && text != null) SizedBox(width: wJM(1)),
              if (text != null)
                Expanded(
                  child: Text(
                    text!,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: textStyle != null
                        ? textStyle!.copyWith(color: buttonTextColor)
                        : CommonTheme.bodyMedium.copyWith(
                            color: buttonTextColor ?? CommonTheme.darkButtonTextColor,
                          ),
                  ),
                ),
            ],
          ),
          child: Center(
            child: SizedBox(
              height: (height != null ? height! / 3 : CommonTheme.defaultButtonHeight / 3),
              width: (height != null ? height! / 3 : CommonTheme.defaultButtonHeight / 3),
              child: CircularProgressIndicator(
                color: progressIndicatorColor ?? CommonTheme.darkButtonTextColor,
                strokeWidth: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
