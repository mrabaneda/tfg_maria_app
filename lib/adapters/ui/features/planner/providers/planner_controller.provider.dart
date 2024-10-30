// Provider para acceder al PlannerController.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/controllers/planner.controller.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/states/planner.state.dart';

final plannerProvider = AutoDisposeStateNotifierProvider<PlannerController, PlannerState>((_) => PlannerController());
