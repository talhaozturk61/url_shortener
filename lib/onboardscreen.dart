import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:storm/urlshortener.dart';

// ignore: must_be_immutable
class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
      title: "Lorem ipsum dolorm sit amet",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat enim, imperdiet tristique elit in, laoreet pharetra leo. ",
      image: Image.network(
        'https://www.kayrasoft.com.tr/images/service/ar-ge.png',
      ),
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
      title: "Lorem ipsum dolorm sit amet",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat enim, imperdiet tristique elit in, laoreet pharetra leo. ",
      image: Image.network(
        'https://consumer-tkbdownload.huawei.com/ctkbfm/applet/simulator/tr-tr15760084/img/2.png',
      ),
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
      ),
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
        next: const Text("Go"),
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) =>  const UrlShortener())));
        },
        onSkip: () {},
        showBackButton: true,
        back: const Text("Skip"),
        skip: const Text("Skip"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
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
