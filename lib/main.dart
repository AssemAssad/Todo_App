import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/views/screens/home/HomeScreen.dart';
import 'package:gsg_flutter/todo_app/views/screens/login/register_screen.dart';
import 'package:gsg_flutter/route/router.dart';
import 'package:gsg_flutter/todo_app/data/sp_helper.dart';
import 'package:gsg_flutter/todo_app/views/screens/login/splash_screen.dart';
import 'package:gsg_flutter/todo_app/data/db_helper.dart';
import 'package:gsg_flutter/todo_app/provider/db_provider.dart';
import 'package:gsg_flutter/todo_app/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSp();
  await DbHelper.dbHelper.initDatabase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DbProvider>(create: (_) {
          return DbProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRoute.navkey,
        home: MainScreen(),
      ),
    );
  }
}
