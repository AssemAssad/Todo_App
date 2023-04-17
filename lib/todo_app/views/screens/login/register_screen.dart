import 'package:flutter/material.dart';
import 'package:gsg_flutter/todo_app/data/sp_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var emailEditingController = TextEditingController();
    var nameEditingController = TextEditingController();
    var phoneEditingController = TextEditingController();
    String? name = '';
    String? email = '';
    String? phone = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RegisterScreen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PNU',
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'الإسم كاملا',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  TextFormField(
                    controller: nameEditingController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'البريد',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PNU',
                        color: Colors.grey),
                  ),
                  TextFormField(
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'الهاتف',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PNU',
                        color: Colors.grey),
                  ),
                  TextFormField(
                    controller: phoneEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            name = nameEditingController.text;
                            email = emailEditingController.text;
                            phone = phoneEditingController.text;
                            SpHelper.spHelper.saveNewUser(name!, email!, phone!);
                          });
                         },
                        child: const Text('Register')),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // SpHelper.spHelper.getUser();
                          });
                        },
                        child: const Text('show User')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
