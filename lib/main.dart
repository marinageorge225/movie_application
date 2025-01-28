import 'package:flutter/material.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/OnBoarding.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/tabs/profile_tab/update_profile.dart';
import 'package:graduation_movie_app/utils/app_theme.dart';

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
      theme: AppTheme.themeData,
      initialRoute:ShowOnBorading==true?LoginView.routeName:OnBoarding.routeName,
      routes: {HomeScreen.routename: (context) => HomeScreen(),
        OnBoarding.routeName:(context)=>OnBoarding(),
        UpdateProfile.routeName:(context)=>UpdateProfile(),
        LoginView.routeName:(context)=>LoginView(),


      },
    );
  }
}
