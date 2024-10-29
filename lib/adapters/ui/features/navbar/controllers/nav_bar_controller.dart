import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/navbar/helpers/constants.dart';

class NavBarController extends StateNotifier<int> {
  NavBarController() : super(defaultTab);

  void changeTab(int actualTab) {
    if (!mounted) return;
    state = actualTab;
  }

  bool? back() {
    if (!mounted) return null;
    if (state == defaultTab) return false;
    state = defaultTab;
    return true;
  }
}
