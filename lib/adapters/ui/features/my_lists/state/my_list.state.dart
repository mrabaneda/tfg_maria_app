import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list.view.model.dart';

class MyListState {
  final AsyncValue<bool> asyncState;
  final List<MyListViewModel> myLists;

  MyListState({
    required this.asyncState,
    required this.myLists,
  });

  factory MyListState.initial() => MyListState(
        asyncState: const AsyncData(false),
        myLists: _generateMyLists(),
      );

  static List<MyListViewModel> _generateMyLists() {
    return [
      MyListViewModel(
        title: 'Mis películas favoritas',
        description: '- Nicky, la aprendiz de bruja\n- El Castillo Ambulante\n- Ponyo',
        descriptionImagesUrls: [
          'https://storage.googleapis.com/tfg-maria-14cce.appspot.com/user_images/zubi22/9d587af8-d2d2-466a-8803-31379b4de328.jpg',
          'https://storage.googleapis.com/tfg-maria-14cce.appspot.com/user_images/zubi22/1991fdf1-9ce0-4ebf-9454-42e7f082aaca.png',
          'https://storage.googleapis.com/tfg-maria-14cce.appspot.com/user_images/zubi22/e523b4dd-d13d-4937-a5ea-09eab4346cff.jpg',
        ],
      ),
      MyListViewModel(
        title: 'Lista de la compra',
        description: '- Plátanos\n- Helado de chocolate\n- Leche sin azúcar',
        descriptionImagesUrls: [
          'https://static.arasaac.org/pictograms/4653/4653_300.png',
          'https://static.arasaac.org/pictograms/34092/34092_300.png',
          'https://static.arasaac.org/pictograms/34008/34008_300.png',
        ],
      ),
    ];
  }

  MyListState copyWith({
    AsyncValue<bool>? asyncState,
    List<MyListViewModel>? myLists,
  }) {
    return MyListState(
      asyncState: asyncState ?? this.asyncState,
      myLists: myLists ?? this.myLists,
    );
  }
}
