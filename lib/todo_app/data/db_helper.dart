import 'package:gsg_flutter/todo_app/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DbHelper {

  static DbHelper dbHelper = DbHelper();
  DbHelper(){
    initDatabase();
  }
  static const String tableName = 'tasks';
  static const String tackIdColumName = 'id';
  static const String tackNameColumName = 'taskName';
  static const String tackIsCompleteColumName = 'tasksComplete';
  Database? database;

  initDatabase() async{
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'task.db';
    String fullPath = join(databasePath,databaseName);
    Database database = await openDatabase(
      fullPath,
      version: 1,
      onCreate: (db,i)
      {
        db.execute('CREATE TABLE $tableName ($tackIdColumName INTEGER PRIMARY KEY AUTOINCREMENT, $tackNameColumName TEXT, $tackIsCompleteColumName INTEGER)');
        print('Create database');
      },
      onOpen: (db)
      {
        print('Open database');

      },
      );
    return database;
  }

  insertNewTask(TaskModel taskModel) async{
    int rowIndex = await
    database!.insert(
        tableName,
        taskModel.toMap()
    );
    print(rowIndex);
  }

  Future<List<TaskModel>> selectAllTask() async{
    List<Map<String,Object?>> rowsAsMaps =
    await  database!.query(tableName);
     List<TaskModel> tasks =rowsAsMaps.map((e) => TaskModel.fromMap(e)).toList();
     return tasks;
  }

  selectOneTask(int id){
    database!.query(
      tableName,
      where: '$tackIdColumName =?',
      whereArgs: [id]
    );
  }
  updateOneTask(TaskModel taskModel) async {
    await database!.update(
      tableName,
      taskModel.toMap(),
      where: '$tackIdColumName =?',
      whereArgs: [taskModel.id]
        );
  }
  deleteOneTask(int id){
    database!.delete(
      tableName,
      where: '$tackIdColumName =?',
      whereArgs: [id]
    );
  }
}