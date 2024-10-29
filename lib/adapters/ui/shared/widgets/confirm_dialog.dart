import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';

class ConfirmDialog extends StatelessWidget {
  final double? height;
  final Icon icon;
  final String titleText;
  final String bodyText;
  final TextStyle? bodyTextStyle;
  final String? backButtonText;
  final Color? backButtonColor;
  final AlignmentGeometry? backButtonAlign;
  final int? bodyMaxLines;
  final void Function()? onClick;

  const ConfirmDialog({
    super.key,
    this.height,
    required this.icon,
    required this.titleText,
    required this.bodyText,
    this.bodyTextStyle,
    this.backButtonText,
    this.backButtonColor,
    this.backButtonAlign,
    this.bodyMaxLines = 4,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: CommonTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: CommonTheme.defaultCardRadius),
      child: Container(
        width: wJM(70),
        height: height ?? hJM(35),
        padding: EdgeInsets.all(hJM(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                SizedBox(width: wJM(2)),
                (titleText.length <= 20)
                    ? SizedBox(
                        height: hJM(4.5),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(titleText, style: CommonTheme.titleLarge),
                        ),
                      )
                    : SizedBox(
                        width: wJM(45),
                        height: hJM(4.5),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(titleText, style: CommonTheme.titleLarge),
                        ),
                      ),
              ],
            ),
            Text(
              bodyText,
              style: bodyTextStyle ?? CommonTheme.bodyMediumStyle,
              maxLines: bodyMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: backButtonAlign ?? Alignment.centerRight,
              child: BaseButton(
                text: backButtonText ?? 'Volver',
                height: hJM(6),
                width: wJM(30),
                buttonTextColor: CommonTheme.darkButtonTextColor,
                backgroundColor: backButtonColor ?? CommonTheme.cancelButtonColor,
                onClick: () => Navigator.pop(context, false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
