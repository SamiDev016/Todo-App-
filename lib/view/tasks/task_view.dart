import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:todoapplication/extentions/space_exs.dart';
import 'package:todoapplication/models/task.dart';
import 'package:todoapplication/utils/app_colors.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:todoapplication/view/tasks/components/date_time_selection.dart';
import 'package:todoapplication/view/tasks/components/rep_text_field.dart';
import 'package:todoapplication/view/tasks/widgets/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView(
      {super.key,
      required this.titleTaskController,
      required this.descTaskController,
      required this.task});

  final TextEditingController? titleTaskController;
  final TextEditingController? descTaskController;
  final Task? task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var title;
  var subTitle;
  DateTime? time;
  DateTime? date;

  String showTime(DateTime? time){
    if (widget.task?.createdAtTime == null) {
      if(time == null){
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      }else{
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a').format(widget.task!.createdAtTime).toString();
    }
  }

  String showDate(DateTime? date){
    if (widget.task?.createdAtDate == null) {
      if(date == null){
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      }else{
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(widget.task!.createdAtDate).toString();
    }
  }

  bool isTaskIsAlreadyExist() {
    if (widget.titleTaskController?.text == null &&
        widget.descTaskController?.text == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSideTexts(textTheme),
                _buildMainTaskViewActivity(textTheme, context),
                _buildButtomSideButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtomSideButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {},
            minWidth: 150,
            height: 55,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                const Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                ),
                5.w,
                const Text(
                  "Delete Task",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 150,
            height: 55,
            color: AppColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const Text(
              "Add Task",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return SizedBox(
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
          RepTextField(
            controller: widget.titleTaskController,
            onFieldSubmitted: (String inputTitle) {
              title = inputTitle;
            },
            onChanged: (String inputTitle) {
              title = inputTitle;
            },
          ),

          10.h,

          RepTextField(
            controller: widget.descTaskController,
            isForDesc: true,
            onFieldSubmitted: (String inputSubTitle) {
              subTitle = inputSubTitle;
            },
            onChanged: (String inputSubTitle) {
              subTitle = inputSubTitle;
            },
          ),

          DateTimeWidget(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => SizedBox(
                        height: 280,
                        child: TimePickerWidget(
                          //initDateTime: ,
                          onChange: (_, __) {},
                          dateFormat: "HH:mm",
                          onConfirm: (dateTime, _) {
                            setState(() {
                              if (widget.task?.createdAtTime == null) {
                                time = dateTime;
                              } else {
                                widget.task!.createdAtTime = dateTime;
                              }
                            });
                          },
                        ),
                      ));
            },

            title: AppStr.timeString,
            time: showTime(time),
          ),

          DateTimeWidget(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                maxDateTime: DateTime(2030, 5, 5),
                minDateTime: DateTime.now(),
                //initialDateTime: ,
                onConfirm: (dateTime, _) {
                  setState(() {
                              if (widget.task?.createdAtDate == null) {
                                date = dateTime;
                              } else {
                                widget.task!.createdAtDate = dateTime;
                              }
                            });
                },
              );
            },
            title: AppStr.dateString, 
            time: showDate(date),
          ),
        ],
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
                text: isTaskIsAlreadyExist()
                    ? AppStr.addNewTask
                    : AppStr.updateCurrentTask,
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
