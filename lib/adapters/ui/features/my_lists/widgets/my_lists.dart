import 'package:flutter/material.dart';
import 'package:tfg_maria_app/adapters/ui/features/planner/widgets/task_status_checkbox.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/screen_functions.dart';
import 'package:tfg_maria_app/adapters/ui/shared/styles/theme.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/base_app_bar.dart';
import 'package:tfg_maria_app/adapters/ui/shared/widgets/body.dart';

class MyLists extends StatelessWidget {
  const MyLists({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          appBar: const BaseAppBar(title: "Mis Listas"),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: CommonTheme.defaultBodyPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ListItem(
                    width: wJM(45),
                    title: 'Hacer la compra',
                    backgroundColor: CommonTheme.thirdColorLight,
                    tasks: ['Tomates', 'Pan', 'Chocolate', 'Plátanos'],
                  ),
                  _ListItem(
                    width: wJM(45),
                    title: 'Mis películas favoritas',
                    backgroundColor: CommonTheme.secondaryColorLight,
                    tasks: ['El castillo Ambulante', 'Ponyo', 'Chihiro', 'Kiki', 'Spiderman', 'Titanic'],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final List<String> tasks;
  final double width;
  final Color backgroundColor;

  const _ListItem({
    required this.title,
    required this.tasks,
    required this.width,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: CommonTheme.defaultBodyPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(wJM(3)),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CommonTheme.titleMedium.copyWith(color: CommonTheme.statusBarColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: hJM(2)),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (_, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskStatusCheckbox(isChecked: false),
                SizedBox(width: wJM(2)),
                SizedBox(
                  width: wJM(29),
                  child: Text(tasks[index], style: CommonTheme.bodyMediumStyle, maxLines: 2, overflow: TextOverflow.ellipsis)),
              ],
            ),
            separatorBuilder: (_, __) => SizedBox(height: hJM(1)),
          ),
        ],
      ),
    );
  }
}
