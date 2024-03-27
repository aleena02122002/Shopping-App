import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              //padding:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              margin: const EdgeInsets.all(60.0),
              height: 190,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: Colors.blue[300]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[350]),
          ),
        ],
      ),
    );
  }
}
