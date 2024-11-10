import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/controllers/my_list.controller.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/state/my_list.state.dart';

final myListProvider = AutoDisposeStateNotifierProvider<MyListController, MyListState>((_) => MyListController());
