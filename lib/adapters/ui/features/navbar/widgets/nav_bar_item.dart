import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_button.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/size_extension.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/models/nav_bar_item_view_model.dart';

class NavBarItem extends StatelessWidget {
  final NavBarItemViewModel navBarItemViewModel;

  const NavBarItem({
    super.key,
    required this.navBarItemViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navBarItemViewModel.onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: hJM(0.6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BaseButton(
              width: wJM(8),
              height: wJM(8),
              padding: EdgeInsets.zero,
              borderRadius: CommonTheme.navbarItemRadius,
              backgroundColor: navBarItemViewModel.isSelected ? CommonTheme.navbarItemSelectedBackgroundColor : Colors.transparent,
              icon: Icon(
                navBarItemViewModel.iconData,
                size: 0.025.sh,
                color: navBarItemViewModel.isSelected ? CommonTheme.backgroundColor : CommonTheme.textColor,
              ),
            ),
            Text(
              navBarItemViewModel.label,
              style: CommonTheme.labelSmall.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
