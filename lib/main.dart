import 'package:flutter/material.dart';
import 'package:maths/view/onboarding_page.dart';
import 'HomeScreen.dart';
import 'SplashScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mathematics',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home:SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: {
      SplashScreen.id: (context) => SplashScreen(),
        PageOnBorarding.id: (context) => PageOnBorarding(),
        HomeScreen.id: (context) => HomeScreen(),

    },
    );
  }
}
