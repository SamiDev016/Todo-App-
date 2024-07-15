import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapplication/models/task.dart';

class HiveDateStore{



  
  static const boxName = 'taskBox';

  final Box<Task> box = Hive.box<Task>(boxName) ; 

  // add new task
  Future<void> addTask ({required Task task}) async{
    await box.put(task.id, task);
  }

  //Show Task
  Future<Task?> getTask({required String id}) async{
    return box.get(id);
  }

  //Update Task
  Future<void> updateTask({required Task task}) async{
    await task.save();
  }

  //Delete Task
  Future<void> deleteTask({required Task task}) async{
    await task.delete();
  }


  //Listen to Box Changes
  ValueListenable<Box<Task>> listenToTask()=> box.listenable();

}