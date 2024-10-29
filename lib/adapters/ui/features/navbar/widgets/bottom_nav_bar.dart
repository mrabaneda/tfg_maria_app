import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/models/nav_bar_item_view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/providers/nav_bar_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/widgets/nav_bar_item.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: CommonTheme.baseBarHeight,
      decoration: BoxDecoration(
        color: CommonTheme.navBarColor,
        border: Border.all(width: 0, color: Colors.transparent),
        boxShadow: CommonTheme.defaultNavBarboxShadow,
      ),
      child: Row(
        children: List.generate(
          navBarItems.length,
          (index) => Expanded(
            child: NavBarItem(
              navBarItemViewModel: NavBarItemViewModel(
                iconData: ref.watch(navBarControllerProvider) == index
                    ? navBarItemsSelected.elementAt(index).iconData
                    : navBarItems.elementAt(index).iconData,
                isSelected: ref.watch(navBarControllerProvider) == index,
                label: labels.elementAt(index),
                onPressed: () => ref.read(navBarControllerProvider.notifier).changeTab(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
