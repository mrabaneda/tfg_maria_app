import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: CommonTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: CommonTheme.defaultCardRadius),
      child: Container(
        width: wJM(65),
        height: hJM(33),
        padding: EdgeInsets.all(hJM(2.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.exit_to_app_outlined, color: CommonTheme.errorColor, size: hJM(4)),
                SizedBox(width: wJM(2)),
                SizedBox(
                  height: hJM(4.5),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Salir", style: CommonTheme.titleLarge),
                  ),
                ),
              ],
            ),
            Text(
              '¿Desea salir de la aplicación?',
              style: CommonTheme.bodyLargeStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BaseButton(
                  text: "Volver",
                  height: hJM(6),
                  width: wJM(25),
                  backgroundColor: CommonTheme.cancelButtonColor,
                  onClick: () => Navigator.pop(context, false),
                ),
                SizedBox(width: wJM(2)),
                BaseButton(
                  text: "Sí, salir",
                  height: hJM(6),
                  width: wJM(25),
                  backgroundColor: CommonTheme.errorColor,
                  onClick: () => Navigator.pop(context, true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
