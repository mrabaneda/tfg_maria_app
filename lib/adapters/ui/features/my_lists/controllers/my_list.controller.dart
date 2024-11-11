import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list.view.model.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list_item.view_model.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/state/my_list.state.dart';

class MyListController extends StateNotifier<MyListState> {
  MyListController() : super(MyListState.initial());

  Future<void> createList(
    String title,
    String imageUrl,
    List<MyListItemViewModel> myListItems,
  ) async {
    try {
      if (state.asyncState.isLoading) return;

      if (mounted) {
        state = state.copyWith(asyncState: const AsyncLoading());
      }

      await Future.delayed(Duration(seconds: 3));

      if (title.isEmpty) throw Exception('El título de la nueva lista no puede estar vacío.');
      if (imageUrl.isEmpty) throw Exception('La descripción de la nueva lista no puede estar vacío.');
      if (myListItems.isEmpty) throw Exception('La tarea debe tener un título y una descripción.');

      final newList = MyListViewModel(
        title: title,
        imageUrl: imageUrl,
        myListItems: myListItems,
      );

      if (mounted) {
        state = state.copyWith(myLists: [...state.myLists, newList], asyncState: const AsyncData(true));
      }
    } on Exception catch (ex) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(ex, StackTrace.current));
    } catch (err) {
      if (mounted) state = state.copyWith(asyncState: AsyncError(err, StackTrace.current));
    }
  }
}
