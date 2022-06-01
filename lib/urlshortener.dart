import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storm/getx_controller.dart';

class UrlShortener extends StatelessWidget {
  UrlShortener({Key? key}) : super(key: key);
  Future<String?> shortenUrl({required String url}) async {
    try {
      final result = await http.post(
          Uri.parse('https://cleanuri.com/api/v1/shorten'),
          body: {'url': url});

      if (result.statusCode == 200) {
        final jsonResult = jsonDecode(result.body);
        return jsonResult['result_url'];
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
    return null;
  }

  final MyController c = Get.put(MyController());
  final controller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    labelText: 'Enter your url here',
                    hintText: 'https://www.example.com',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 8, color: Colors.black))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                
              },
              child: const Text('Shorten url'),
            ),
            Obx((() => Text(
                  '${c.sayi.toString()}',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ))),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      c.increment();
                     // c.addlist('')
;                    },
                    icon: Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      c.discrement();
                    },
                    icon: Icon(Icons.remove))
              ],
            ),
            Container(
                height: 300,
                color: Colors.grey,
                child: Obx((() => ListView.builder(
                      itemCount: c.mylist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Obx(() => Text(c.myurl.value,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)));
                      },
                    ))))
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 130);
    var controllPoint = Offset(30, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
