import 'package:flutter/material.dart';

class SpashView extends StatelessWidget {
  const SpashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Expanded(
              child: Image.asset('assets/images/spl1.jpeg')
          ),
          const SafeArea(
            child: Text("E-commerce"),
          ),
          Container(
            width: 400,
            height: 50,
            margin:const EdgeInsets.symmetric(vertical: 400, horizontal: 110),
            padding: const EdgeInsets.only(right: 5,left: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30),
              ),
              color: Colors.grey,
            ),
             child: const Center(child: Text(" Continue with Email")),
          )
        ],
      ),
    );
  }
}
