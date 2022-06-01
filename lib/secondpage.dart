import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ControllerBox extends GetxController {
  var check = false.obs;
}

final  ControllerBox ctrl = Get.put(ControllerBox());

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Obx((() => Center(
            child: CheckboxListTile(
                value: ctrl.check.value,
                onChanged: (value) {
                  ctrl.check.value = !ctrl.check.value;
                }),
          ))),
    );
  }
}
