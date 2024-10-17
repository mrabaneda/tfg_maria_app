import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/vale_bar.dart';

class Body extends StatelessWidget {
  final Widget? appBar;
  final Widget child;

  const Body({
    super.key,
    required this.child,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const ValeBar(), if (appBar != null) appBar!, Expanded(child: child)],
    );
  }
}
