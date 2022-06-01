import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'secondpage.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
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
            clipper: WaveClip(),
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

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 20;
    final highPoint = size.height - 40;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
