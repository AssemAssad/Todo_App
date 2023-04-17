import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/data/sp_helper.dart';
import 'package:gsg_flutter/todo_app/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  UserModel userModel;
  HomeScreen(this.userModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            SpHelper.spHelper.deleteUser();
          },child: Text(
            'back'
          )),
        ],
      ),
    );
  }
}
