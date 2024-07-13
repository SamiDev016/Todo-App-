import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/utils/app_colors.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:todoapplication/utils/constants.dart';
import 'package:todoapplication/view/home/widget/fab.dart';
import 'package:todoapplication/view/home/widget/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<int> testing = [];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Fab(),
      body: _buildHomeBody(textTheme),
    );
  }


  //Home body
  Widget _buildHomeBody(TextTheme textTheme) {
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
                    valueColor:
                        AlwaysStoppedAnimation(AppColors.primaryColor),
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
            height: 600,
            width: double.infinity,
            child: testing.isNotEmpty? ListView.builder(
                itemCount: testing.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.horizontal,
                    onDismissed: (_){
                      //amks,dmas
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        8.w,
                        const Text(
                          AppStr.deleteTask
                        )
                      ],
                    ),
                    key: Key(index.toString()),
                    child: const TaskWidget());
                }) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInUp(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Lottie.asset(lottieUrl,
                        animate: testing.isNotEmpty ? false : true
                        ),
                        
                      ),
                      
                    ),
                    FadeInUp(
                      from: 30,

                      child: const Text(
                        AppStr.doneAllTask
                      ),
                    )
                  ],
                )
                
                
          )
        ],
      ),
    );
  }
}
