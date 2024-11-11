import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/providers/planner_controller.provider.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/widgets/my_lists.dart';
import 'package:tfg_maria_app/adapters/ui/features/my_lists/widgets/my_lists_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class MyListsMenu extends ConsumerWidget {
  const MyListsMenu({super.key});

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
                  padding: EdgeInsets.all(wJM(3)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(wJM(3)),
                    color: index.isEven ? CommonTheme.secondaryColor : CommonTheme.thirdColorLight,
                  ),
                  child: MyList(myList: myLists[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
