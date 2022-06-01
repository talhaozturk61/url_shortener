import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:storm/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel( decoration: PageDecoration(imageFlex: 2,),
      title: "Lorem ipsum dolorm sit amet",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat enim, imperdiet tristique elit in, laoreet pharetra leo. ",
      image: Image.network(
          'https://www.kayrasoft.com.tr/images/service/ar-ge.png',
        ),
    ),
    PageViewModel( decoration: PageDecoration(imageFlex: 2,),
      title:"Lorem ipsum dolorm sit amet",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat enim, imperdiet tristique elit in, laoreet pharetra leo. ",
      image: Image.network(
          'https://consumer-tkbdownload.huawei.com/ctkbfm/applet/simulator/tr-tr15760084/img/2.png',
         ),
    ),
    PageViewModel(decoration: PageDecoration(imageFlex: 2,),
      title: "Lorem ipsum dolorm sit amet",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat enim, imperdiet tristique elit in, laoreet pharetra leo. ",
      image: Image.network(
          'https://www.appincubator.io/assets/images/flutter/why-flutter-application-development-services-will-be-best-for-you.png',
         ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        body: SafeArea(
          child: IntroductionScreen(
            
            pages: listPagesViewModel,
            next:  const Text("Go"),
            onDone: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => FirstPage())));},
            onSkip: () {},
            showBackButton: true,
            back:   const Text("Skip"),
           skip: const Text("Skip"),
            done:
                const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ));
  }
}
