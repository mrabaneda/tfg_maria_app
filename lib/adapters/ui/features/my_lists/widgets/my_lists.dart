import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/widgets/my_lists_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class MyLists extends ConsumerWidget {
  const MyLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLists = ref.watch(myListProvider.select((value) => value.myLists));
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const MyListsAppBar(),
          child: Padding(
            padding: CommonTheme.defaultBodyPadding.copyWith(bottom: 0.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (_, __) => SizedBox(height: hJM(3)),
              itemCount: myLists.length,
              itemBuilder: (_, index) {
                return Container(
                  padding: CommonTheme.defaultBodyPadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(wJM(3)),
                    color: index.isEven ? CommonTheme.secondaryColorLight : CommonTheme.thirdColorLight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myLists[index].title,
                        style: CommonTheme.titleMedium.copyWith(color: CommonTheme.statusBarColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: hJM(2)),
                      Text(myLists[index].description, style: CommonTheme.bodyMediumStyle),
                      SizedBox(height: hJM(2)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: myLists[index].descriptionImagesUrls.map(
                          (imageUrl) {
                            return SizedBox(
                              height: hJM(9),
                              width: hJM(9),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(wJM(1)),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
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
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
