import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/main.dart';
import 'package:todoapplication/models/task.dart';
import 'package:todoapplication/utils/app_colors.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:todoapplication/utils/constants.dart';
import 'package:todoapplication/view/home/components/fab.dart';
import 'package:todoapplication/view/home/components/home_app_bar.dart';
import 'package:todoapplication/view/home/components/slider_drawer.dart';
import 'package:todoapplication/view/home/widget/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final base = BaseWidget.of(context);

    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTask(),
      builder: (ctx, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        tasks.sort((a , b) => a.createdAtDate.compareTo(b.createdAtDate));

        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Fab(),
          body: SliderDrawer(
            key: drawerKey,
            isDraggable: false,
            animationDuration: 1000,
            slider: CustomDrawer(),
            appBar: HomeAppBar(drawerKey: drawerKey),
            child: _buildHomeBody(
              textTheme,
              base,
              tasks
            ),
          ),
        );
      },
    );
  }

  //Home body
  Widget _buildHomeBody(
      TextTheme textTheme, BaseWidget base, List<Task> tasks) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          //Costum App BAR
          Container(
            margin: const EdgeInsets.only(top: 60),
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStr.mainTitle,
                      style: textTheme.displayLarge,
                    ),
                    3.h,
                    Text(
                      "1 of  Tasks",
                      style: textTheme.titleMedium,
                    )
                  ],
                )
              ],
            ),
          ),

          //Divider
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),

          //TASKS
          SizedBox(
              height: 300,
              width: double.infinity,
              child: tasks.isNotEmpty
                  ? ListView.builder(
                      itemCount: tasks.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var task = tasks[index];
                        return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (_) {
                              //amks,dmas
                              base.dataStore.deleteTask(task: task);
                            },
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                8.w,
                                const Text(AppStr.deleteTask)
                              ],
                            ),
                            key: Key(task.id),
                            child: TaskWidget(
                              task: task,
                            ));
                      })
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(lottieUrl,
                                animate: tasks.isNotEmpty ? false : true),
                          ),
                        ),
                        FadeInUp(
                          from: 30,
                          child: const Text(AppStr.doneAllTask),
                        )
                      ],
                    ))
        ],
      ),
    );
  }
}
