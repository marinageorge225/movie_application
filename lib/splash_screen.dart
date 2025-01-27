import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_movie_app/home_screen.dart';
// test commit 2
class SplashScreen extends StatefulWidget {
  static const String routename = 'splash screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2FEFF),
      body: Center(
        child: Image.asset('assets/images/splash_screen.png'),
      ),
    );
  }
}