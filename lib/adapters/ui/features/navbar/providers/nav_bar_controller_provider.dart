import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/controllers/nav_bar_controller.dart';

final navBarControllerProvider = AutoDisposeStateNotifierProvider<NavBarController, int>(
  (ref) => NavBarController(),
);
