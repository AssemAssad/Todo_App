import 'package:flutter/Material.dart';
import 'package:gsg_flutter/todo_app/data/db_helper.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:provider/provider.dart';

import '../../provider/db_provider.dart';

class TaskWidget extends StatelessWidget {

  TaskModel taskModel;

  TaskWidget(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(
      builder: (context,provider,x) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          child: CheckboxListTile(
            secondary: IconButton(onPressed: () {
              provider.deleteTask(taskModel);
            },
               icon: Icon( Icons.delete,color: Colors.red,),),
            value: taskModel.isComplete,
            onChanged: (value) {
              provider.updateTask(taskModel);
            },
            title: Text(taskModel.title!),
          ),
        );
      }
    );
  }
}
