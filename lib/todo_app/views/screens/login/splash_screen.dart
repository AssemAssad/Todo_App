import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/data/sp_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  initFun()async{
    await Future.delayed(Duration(seconds: 3));
    SpHelper.spHelper.getUser();
  }
  @override
  Widget build(BuildContext context) {
    initFun();
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
