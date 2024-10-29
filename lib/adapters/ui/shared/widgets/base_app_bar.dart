import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';

class BaseAppBar extends StatelessWidget {
  final String title;
  final bool back;
  final bool boxShadow;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final int? maxLines;

  const BaseAppBar({
    super.key,
    required this.title,
    this.back = false,
    this.boxShadow = false,
    this.backgroundColor,
    this.textStyle,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? CommonTheme.appBarColor,
        border: Border.all(width: 0, color: Colors.transparent),
        boxShadow: boxShadow ? CommonTheme.defaultAppBarboxShadow : null,
      ),
      height: CommonTheme.appBarHeight,
      child: Row(
        children: [
          Visibility(
            visible: back,
            child: const _AppBarBackButton(),
          ),
          SizedBox(width: wJM(2)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: back ? 0 : wJM(3)),
              child: Text(
                title,
                style: textStyle ?? CommonTheme.appBarTextStyle,
                maxLines: maxLines ?? 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(width: wJM(3)),
        ],
      ),
    );
  }
}

class _AppBarBackButton extends StatelessWidget {
  const _AppBarBackButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        context.pop();
      },
      child: Padding(
        padding: EdgeInsets.all(wJM(2)),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: CommonTheme.statusBarColor,
          size: hJM(3.5),
        ),
      ),
    );
  }
}
