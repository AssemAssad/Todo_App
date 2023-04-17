import 'package:flutter/Material.dart';
import 'package:gsg_flutter/todo_app/data/db_helper.dart';
import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:gsg_flutter/todo_app/views/screens/all_tasks_screen.dart';
import 'package:gsg_flutter/todo_app/views/screens/completed_tasks_screen.dart';
import 'package:gsg_flutter/todo_app/views/screens/incompleted_tasks_screen.dart';
import 'package:provider/provider.dart';

import '../../data/data_repo.dart';
import 'new_task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin{
  // getAllTasks() async{
  //   task = await Provider.of<DbHelper>(context).selectAllTask();
  //   setState(() {
  //
  //   });
  // }
  // changeTaskStatus(TaskModel taskModel){
  //   TaskModel t = taskModel;
  //   int index = task.indexOf(taskModel);
  //   task[index].isComplete = !task[index].isComplete;
  //   Provider.of<DbHelper>(context).updateOneTask(taskModel);
  //   setState(() {
  //
  //   });
  // }
  // removeTaskStatus(TaskModel taskModel){
  //   task.remove(taskModel);
  //   Provider.of<DbHelper>(context).deleteOneTask(taskModel.id!);
  //   setState(() {
  //
  //   });
  // }
  // SetStateAfterAddNewTask(){
  //   setState(() {
  //
  //   });
  // }
  TabController? tabController;
  initTabBar(){
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initTabBar();
    // getAllTasks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Todo App'),
      bottom:  TabBar(
        controller: tabController,
          tabs:  const [
        Tab(icon: Icon(Icons.list),),
        Tab(icon: Icon(Icons.done),),
        Tab(icon: Icon(Icons.cancel),),
      ])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).
          push(MaterialPageRoute(
            builder: (context) => NewTaskScreen(),));
      },),
      body:  TabBarView(
        controller: tabController,
        children: [
          AllTaskScreen(),
          CompletedTaskScreen(),
          InCompletedTaskScreen()
        ],
      ),
    );
  }
}
