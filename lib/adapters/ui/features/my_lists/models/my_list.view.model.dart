import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list_item.view_model.dart';

class MyListViewModel {
  final String title;
  final String imageUrl;
  final List<MyListItemViewModel> myListItems;

  MyListViewModel({
    required this.title,
    required this.imageUrl,
    required this.myListItems,
  });

  MyListViewModel copyWith({
    String? title,
    String? imageUrl,
    List<MyListItemViewModel>? myListItems,
  }) {
    return MyListViewModel(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      myListItems: myListItems ?? this.myListItems,
    );
  }
}
