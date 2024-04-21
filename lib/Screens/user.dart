import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Userr');

  addUser() async {
    await users.add(
      {
        "email": emailController.text,
        "user" : userNameController.text,
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration:const InputDecoration(
              labelText: 'Email',
            ),
            obscureText: false,
            controller: emailController,
          ),
          TextField(
            decoration:const InputDecoration(
              labelText: 'User Name',
            ),
            obscureText: false,
            controller: userNameController,
          ),
          ElevatedButton(onPressed: ()async{ await addUser();}, child: const Text("Login")),
        ],
      ),
    );
  }
}
