import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:storm/deneme.dart';

import 'package:storm/startPage.dart';

import 'getx_controller.dart';

void main() {

GetIt.I.registerSingleton(ProductService());
GetIt.I.registerSingleton(ShoppingCartService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Deneme(),
    );
  }
}
