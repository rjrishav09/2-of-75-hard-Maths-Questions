import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../HomeScreen.dart';
import '../widgets/build_images.dart';

class PageOnBorarding extends StatefulWidget {
  static const String id = 'PageOnBorarding-screen';
  const PageOnBorarding({Key? key}) : super(key: key);

  @override
  State<PageOnBorarding> createState() => _PageOnBorardingState();
}

class _PageOnBorardingState extends State<PageOnBorarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Fantasy',
            body:
                'Please like your photos:.',
            image: const BuildImages(image: 'assets/images/1.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Science fiction',
            body:
                'Science is a Game:',
            image: const BuildImages(image: 'assets/images/2.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Text books',
            body:
                'Welcome EveryOne My Name is Rishav:',
            image: const BuildImages(image: 'assets/images/3.jpg'),
            decoration: getPageDecoration(),
          ),
        ],
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        // onSkip: () => print('skip'),
        // showBackButton: true,
        // back: const Icon(Icons.arrow_back),
        dotsDecorator: getDotDecoration(),
        nextFlex: 0,
        skipOrBackFlex: 0,
        animationDuration: 500,
        isProgressTap: true,
        isProgress: true,
        // freeze: false,
        onChange: (index) => print(index),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      bodyTextStyle: TextStyle(fontSize: 20),
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.zero,
      bodyPadding: EdgeInsets.all(20),
      pageColor: Colors.white,
    );
  }

  DotsDecorator getDotDecoration() {
    return DotsDecorator(
        color: const Color(0xFFBDBDBD),
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeColor: Colors.orange,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)));
  }

  void goToHome(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
