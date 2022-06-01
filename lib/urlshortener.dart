import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'secondpage.dart';

class UrlShortener extends StatelessWidget {
  const UrlShortener({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(SecondPage()),
      ),
      body: Column(
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
              final shortenedUrl = await shortenUrl(url: controller.text);
              if (shortenedUrl != null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Url Shortened Successfully'),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      color: Colors.grey.withOpacity(.2),
                                      child: Text(shortenedUrl),
                                    ),
                                  ),
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: shortenedUrl))
                                              .then((_) => ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Urls is copied to the clipboard'))));
                                        },
                                        icon: const Icon(Icons.copy)),
                                  )
                                ],
                              ),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    controller.clear();
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close),
                                  label: const Text('Close'))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please provide a url',
                      style: TextStyle(color: Colors.red)),
                ));
              }
            },
            child: const Text('Shorten url'),
          )
        ],
      ),
    );
  }
}

class MyClipper  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path =  Path();
    path.lineTo(0, size.height - 130);
    var controllPoint = Offset(30,size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
  
}