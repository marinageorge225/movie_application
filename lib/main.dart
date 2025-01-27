import 'package:flutter/material.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routename,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        SplashScreen.routename: (context) =>SplashScreen(),

      },
    );
  }
}
