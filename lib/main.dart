import 'package:flutter/material.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/utils/app_theme.dart';
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
      initialRoute: LoginView.routeName,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        LoginView.routeName : (context) => LoginView(),
      },
      theme: AppTheme.themeData,
    );
  }
}
