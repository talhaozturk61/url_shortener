import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storm/onboardscreen.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Image.network(
              'https://st4.depositphotos.com/16138592/29248/v/950/depositphotos_292484278-stock-illustration-user-login-vector-flat-illustration.jpg?forcejpeg=true'),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: ElevatedButton(
            child: const Text('Start'),
            onPressed: () {
              Get.to(OnBoardScreen());
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 22))),
          ),
        ),
      ],
    ));
  }
}
