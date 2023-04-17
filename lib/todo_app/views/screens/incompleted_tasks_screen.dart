import 'package:flutter/Material.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/views/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/db_provider.dart';

class InCompletedTaskScreen extends StatelessWidget {
  const InCompletedTaskScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return
      Selector<DbProvider,List<TaskModel>>(
        selector: (context,provider) {
          return provider.incompleteTask;
        },
        builder: (context,anything,x) { //anything => return variable from selector
          return anything.isEmpty?
          Lottie.asset('assets/json/empty.json'):
          ListView.builder(
          itemCount:  anything.length,
          itemBuilder: (context, index) {
            return TaskWidget(anything[index]);
          },

    );
        }
      );
  }
}
