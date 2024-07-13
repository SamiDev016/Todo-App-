import 'package:flutter/material.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/utils/app_colors.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:todoapplication/view/home/widget/fab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Fab(),
      body: SizedBox(
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
              height: 745,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      duration: const Duration(microseconds: 600),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                offset: const Offset(0, 4),
                                blurRadius: 10)
                          ]),
                      child: ListTile(
                        leading: AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey,width: .8),

                            ),
                            child: const Icon(Icons.check,color: Colors.white,),
                            ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
