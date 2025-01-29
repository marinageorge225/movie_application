import 'package:flutter/material.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/OnBoarding.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/splash_screen.dart';

import 'package:graduation_movie_app/ui/auth/Reigster/Resister_Screen.dart';
import 'package:graduation_movie_app/ui/auth/login/forget_password/forget_password.dart';

import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/tabs/profile_tab/update_profile.dart';
import 'package:graduation_movie_app/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/auth/forget_password/forget_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool(OnBoarding.routeName) ?? false;

  runApp(MyApp(
    showOnBoarding: showOnBoarding,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.showOnBoarding});
  final bool? showOnBoarding;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute:SplashScreen.routeName,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        OnBoarding.routeName: (context) => OnBoarding(),
        SplashScreen.routeName: (context) => SplashScreen(ShowOnBorading: ShowOnBorading??false,),
        LoginView.routeName: (context) => LoginView(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        UpdateProfile.routeName:(context) => UpdateProfile(),
        RegisterScreen.routeName:(context) => RegisterScreen(),

      }
    );

}

}
