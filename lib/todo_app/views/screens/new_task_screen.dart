import 'package:flutter/Material.dart';
import 'package:gsg_flutter/route/router.dart';
import 'package:gsg_flutter/todo_app/data/data_repo.dart';
import 'package:gsg_flutter/todo_app/data/db_helper.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/provider/db_provider.dart';
import 'package:provider/provider.dart';

class NewTaskScreen extends StatelessWidget {
  String content = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewTaskScreen'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              content = value;
            },
          ),
          ElevatedButton(onPressed: () async{
            TaskModel taskModel = TaskModel(title: content);
            await Provider.of<DbProvider>(context,listen: false).createNewTask(taskModel);
            AppRoute.popRoute();
          },
          child: Text('Add New Task'))
        ],


      ),
    );
  }
}
