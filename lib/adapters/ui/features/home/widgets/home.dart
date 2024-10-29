import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/home/helpers/constants.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/providers/nav_bar_controller_provider.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';
import 'package:tfg_maria_app/adapters/ui/features/home/widgets/home_app_bar.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const HomeAppBar(),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              height: hJM(80),
              padding: EdgeInsets.all(hJM(2)),
              child: GridView.builder(
                padding: EdgeInsets.all(hJM(3)),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                ),
                itemCount: 4,
                itemBuilder: (_, index) {
                  final homeMenuItem = homeMenuItems[index];
                  return GestureDetector(
                    onTap: () => ref.read(navBarControllerProvider.notifier).changeTab(homeMenuItem.navBarIndex),
                    child: _HomeMenuItem(title: homeMenuItem.title, textStyle: homeMenuItem.style, backgroundColor: homeMenuItem.color),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final Color backgroundColor;

  const _HomeMenuItem({
    required this.title,
    required this.textStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(wJM(3)),
      ),
      child: Center(
        // padding: const EdgeInsets.all(8.0),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
