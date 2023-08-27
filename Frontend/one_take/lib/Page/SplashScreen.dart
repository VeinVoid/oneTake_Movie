import 'dart:async';
import 'package:flutter/material.dart';
import '../widget/Widget.dart';
import 'package:one_take/Page/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgLoader(
              path: 'assets/img/Ic_Splash_App.svg',
              widthImg: 127,
              heightImg: 141
            )
          ],
        ),
      ),
    );
  }
}