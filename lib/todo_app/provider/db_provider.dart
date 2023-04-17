import 'package:flutter/widgets.dart';
import 'package:gsg_flutter/todo_app/data/db_helper.dart';

import '../models/task_model.dart';

class DbProvider extends ChangeNotifier{

  DbProvider(){
    selectAllTask();
  }
  List<TaskModel> allTask = [];
  List<TaskModel> completeTask = [];
  List<TaskModel> incompleteTask = [];

  fillLists(List<TaskModel> tasks){
    allTask = tasks;
    completeTask = tasks.where((element) => element.isComplete).toList();
    incompleteTask = tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  createNewTask(TaskModel taskModel) async{
   await DbHelper.dbHelper.insertNewTask(taskModel);
   selectAllTask();
  }

  selectAllTask() async{
    List<TaskModel> list = await DbHelper.dbHelper.selectAllTask();
    fillLists(list);
  }

  updateTask(TaskModel taskModel) async {
    taskModel.isComplete = !taskModel.isComplete;
    await DbHelper.dbHelper.updateOneTask(taskModel);
    selectAllTask();
  }

  deleteTask(TaskModel taskModel) async{
    await DbHelper.dbHelper.deleteOneTask(taskModel.id!);
    selectAllTask();
  }

}