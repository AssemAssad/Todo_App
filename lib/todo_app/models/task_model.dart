import 'package:gsg_flutter/todo_app/data/db_helper.dart';

class TaskModel {
  int? id ;
  String? title;
  late bool isComplete;

  TaskModel({
    required this.title,
    this.isComplete = false,
  });

  Map<String,dynamic> toMap(){
    return{
      DbHelper.tackNameColumName:title,
      DbHelper.tackIsCompleteColumName: (isComplete)?1:0
    };
  }

  TaskModel.fromMap(Map<String,dynamic> map)
  {
    id = map[DbHelper.tackIdColumName];
    title = map[DbHelper.tackNameColumName];
    isComplete = map[DbHelper.tackIsCompleteColumName]==1?true:false;
  }
}
