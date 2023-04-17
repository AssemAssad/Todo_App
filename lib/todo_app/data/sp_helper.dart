import 'dart:convert';

import 'package:gsg_flutter/todo_app/views/screens/home/HomeScreen.dart';
import 'package:gsg_flutter/todo_app/views/screens/login/register_screen.dart';
import 'package:gsg_flutter/route/router.dart';
import 'package:gsg_flutter/todo_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();

  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferences;

  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  saveNewUser(String name, String email, String phone) async {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'phone': phone,
    };
    String userData = json.encode(map);
  bool x = await sharedPreferences!.setString('user', userData);
  if(x){
    UserModel userModel =UserModel.fromMap(map);
    AppRoute.navigationWidget(HomeScreen(userModel));

  }
  }

  getUser() {
    String? user = sharedPreferences!.getString('user');

    if (user == null) {
      AppRoute.navigationWidget(RegisterScreen());

    } else {
     Map map = json.decode(user);
     UserModel userModel = UserModel.fromMap(map);
      AppRoute.navigationWidget(HomeScreen(userModel));
    }
  }

  deleteUser(){
    sharedPreferences!.remove('user');
    AppRoute.navigationWidget(RegisterScreen());
  }

}
