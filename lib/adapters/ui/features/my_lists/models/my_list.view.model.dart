class MyListViewModel {
  final String title;
  final String description;
  List<String> descriptionImagesUrls;

  MyListViewModel({
    required this.title,
    required this.description,
    required this.descriptionImagesUrls,
  });

  MyListViewModel copyWith({
    String? title,
    String? description,
    List<String>? descriptionImagesUrls,
  }) {
    return MyListViewModel(
      title: title ?? this.title,
      description: description ?? this.description,
      descriptionImagesUrls: descriptionImagesUrls ?? this.descriptionImagesUrls,
    );
  }
}
