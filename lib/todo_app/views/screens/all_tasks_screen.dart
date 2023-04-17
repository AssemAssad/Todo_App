import 'package:flutter/Material.dart';
import 'package:gsg_flutter/todo_app/data/data_repo.dart';
import 'package:gsg_flutter/todo_app/provider/db_provider.dart';
import 'package:gsg_flutter/todo_app/views/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class AllTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(
      builder: (context,provide,x) {
        return ListView.builder(
            itemCount:  provide.allTask.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  provide.allTask[index]);
            },

        );
      }
    );
  }
}
