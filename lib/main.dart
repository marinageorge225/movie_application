import 'package:flutter/material.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/OnBoarding.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs =await SharedPreferences.getInstance();
 final bool ShowOnBorading= prefs.getBool(OnBoarding.routeName)?? false;

  runApp( MyApp(ShowOnBorading:ShowOnBorading ,));

}

class MyApp extends StatelessWidget  {

   MyApp({super.key,required this.ShowOnBorading});
  final bool? ShowOnBorading;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.routeName,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        OnBoarding.routeName:(context)=>OnBoarding(),
        SplashScreen.routeName:(context)=>SplashScreen(),
      },
    );
  }
}
