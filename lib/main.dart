import 'package:flutter/material.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/profile.dart';
import 'package:graduation_movie_app/provider/app_language_provider.dart';
import 'package:graduation_movie_app/splash_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: ( context) =>AppLanguageProvider(),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routename   , ///Profile.routeName
      routes: {
       HomeScreen.routename: (context) => HomeScreen(),
       SplashScreen.routename: (context) =>SplashScreen(),
        Profile.routeName: (context) => Profile(),
      },
      locale: Locale(languageProvider.appLanguage),
    );
  }
}
