import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.white,
      )),
      home: SplashSCreen(),
    );
  }
}

class SplashSCreen extends StatefulWidget {
  @override
  _SplashSCreenState createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          splashIconSize: size.height / 2,
          splash: Image.asset("assets/icons/swiggy_icon.png"),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
