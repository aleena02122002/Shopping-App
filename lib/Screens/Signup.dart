import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  registerUser() async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            obscureText: false,
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: false,
            controller: passwordController,
          ),
          ElevatedButton(onPressed: () {registerUser();}, child: const Text("Register")),
          TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));}, child: const Text("Already Have An Account? LOgin Here")),
          const  Center(child: Text("OR"),),

        ],
      ),
    );
  }
}