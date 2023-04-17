import 'package:flutter/Material.dart';
import 'package:gsg_flutter/todo_app/data/data_repo.dart';
import 'package:gsg_flutter/todo_app/views/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/db_provider.dart';

class CompletedTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Consumer<DbProvider>(
        builder: (context,provider,x) {
          return provider.completeTask.where((element) => element.isComplete).isEmpty?
          Lottie.asset('assets/json/empty.json'):
          ListView.builder(
          itemCount:  provider.completeTask.length,
          itemBuilder: (context, index) {
            return TaskWidget( provider.completeTask[index]);
          },

    );
        }
      );
  }
}
