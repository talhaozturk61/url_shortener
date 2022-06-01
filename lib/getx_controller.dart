import 'package:get/get.dart';

class MyController extends GetxController {
  var sayi = 0.obs;
  var myurl = ' '.obs;

  increment() {
    sayi.value++;
  }

  discrement() {
    sayi.value--;
  }

  List<dynamic> mylist = [].obs;

  addlist(String url) {
    mylist.add(myurl.obs);
  }
}
