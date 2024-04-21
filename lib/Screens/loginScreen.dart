import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_firebase/Screens/Home.dart';
import 'package:ui_firebase/Screens/Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              labelText: 'Password',
            ),
            obscureText: false,
            controller: passwordController,
          ),
          ElevatedButton(onPressed: (){}, child: const Text("Login")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));}, child: const Text("Do not have an Acoount?"))
        ],
      ),
    );
  }
}
