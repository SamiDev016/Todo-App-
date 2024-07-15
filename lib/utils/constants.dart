import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:todoapplication/main.dart';
import 'package:todoapplication/utils/app_str.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

String lottieUrl = 'assets/lottie/1.json';

dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "Fill All Fields",
    corner: 20,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: "EDIT THE TASK FIRST",
    corner: 20,
    duration: 5000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(context,
      title: AppStr.oopsMsg,
      message: "ADD TASK FIRST TO YOU CAN DELETE!",
      buttonText: "OK", onTapDismiss: () {
    Navigator.pop(context);
  }, panaraDialogType: PanaraDialogType.warning);
}

dynamic deleteAllTasks(BuildContext context) {
  return PanaraConfirmDialog.show(context,
      title: AppStr.areYouSure,
      message: "DELETE ALL TASKS ??????",
      confirmButtonText: "YES",
      cancelButtonText: "NO",
      onTapConfirm: (){
        //BaseWidget.of(context).dataStore.box.clear();
        Navigator.pop(context);
      },
      onTapCancel: (){
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false
      );
      
}
