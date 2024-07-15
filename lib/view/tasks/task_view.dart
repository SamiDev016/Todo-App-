import 'package:flutter/material.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:todoapplication/view/tasks/components/rep_text_field.dart';
import 'package:todoapplication/view/tasks/widgets/task_view_app_bar.dart';

class TaskView extends StatefulWidget {

  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSideTexts(textTheme),
                SizedBox(
                  height: 550,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          AppStr.titleOfTitleTextField,
                          style: textTheme.headlineMedium,
                        ),
                      ),

                      //Task Title
                      RepTextField(controller: titleTaskController),

                      10.h,

                      RepTextField(controller: descTaskController,isForDesc: true,),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
            text: TextSpan(
                text: AppStr.addNewTask,
                style: textTheme.titleLarge,
                children: const [
                  TextSpan(
                      text: AppStr.taskStrnig,
                      style: TextStyle(fontWeight: FontWeight.w400))
                ]),
          ),
          const SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
