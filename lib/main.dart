import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/profile.dart';
import 'package:graduation_movie_app/splash_screen.dart';
import 'package:provider/provider.dart';

import 'cubit/app_language_cubit.dart';
void main() {
  runApp(
    BlocProvider(
      create: (context) => AppLanguageCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLanguageCubit, String>
    (
        builder: (context, appLanguage) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            initialRoute: Profile.routeName,

            ///Profile.routeName
            routes: {
              HomeScreen.routename: (context) => HomeScreen(),
              SplashScreen.routename: (context) => SplashScreen(),
              Profile.routeName: (context) => Profile(),
            },
            locale: Locale(appLanguage),
          );
        }
    );


  }
}
