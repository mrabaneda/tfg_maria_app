class MyListItemViewModel {
  final String description;
  final String descriptionImagesUrl;

  MyListItemViewModel({
    required this.description,
    required this.descriptionImagesUrl,
  });

  MyListItemViewModel copyWith({
    String? description,
    String? descriptionImagesUrl,
  }) {
    return MyListItemViewModel(
      description: description ?? this.description,
      descriptionImagesUrl: descriptionImagesUrl ?? this.descriptionImagesUrl,
    );
  }
}
