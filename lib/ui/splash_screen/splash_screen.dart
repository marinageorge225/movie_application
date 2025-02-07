import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/OnBoarding.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash screen';
  final bool showOnBoarding;

   SplashScreen({required this.showOnBoarding});

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
          builder: (context) => widget.showOnBoarding==true?LoginView():OnBoarding()
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash_screen.png'),
      ),
    );
  }
}