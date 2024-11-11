import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/models/my_list.view.model.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_item/audio_preference_only_icon.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';

class MyList extends StatelessWidget {
  final MyListViewModel myList;

  const MyList({
    super.key,
    required this.myList,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MyListTitle(
          title: myList.title,
          imageUrl: myList.imageUrl,
          audioDescription: '${myList.title} ${myList.myListItems.map((item) => item.description).join(', ')}',
        ),
        SizedBox(height: hJM(2)),
        Column(
          children: myList.myListItems
              .asMap()
              .entries
              .map(
                (entry) => Padding(
                  padding: EdgeInsets.symmetric(vertical: hJM(0.2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: hJM(7.5),
                        width: hJM(7.5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(wJM(1)),
                          child: CachedNetworkImage(
                            imageUrl: myList.myListItems[entry.key].descriptionImagesUrl,
                            placeholder: (_, url) => Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: hJM(5),
                                width: hJM(5),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (_, __, ___) => const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: hJM(2)),
                      Text(myList.myListItems[entry.key].description, style: CommonTheme.bodyMediumStyle),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _MyListTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String audioDescription;

  const _MyListTitle({
    required this.title,
    required this.imageUrl,
    required this.audioDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CommonTheme.titleMedium.copyWith(color: CommonTheme.statusBarColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(wJM(1)),
          child: Image.asset(
            imageUrl,
            alignment: Alignment.center,
            height: hJM(8),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: wJM(2)),
        AudioPreferenceOnlyIcon(text: audioDescription),
      ],
    );
  }
}
