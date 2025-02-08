import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/OnBoarding.dart';
import 'package:graduation_movie_app/ui/auth/forget_password/reset_password.dart';
import 'package:graduation_movie_app/ui/home_screen/home_screen.dart';
import 'package:graduation_movie_app/profile.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tab_widget.dart';
import 'package:graduation_movie_app/ui/splash_screen/splash_screen.dart';
import 'package:graduation_movie_app/ui/auth/Reigster/Register_Screen.dart';
import 'package:graduation_movie_app/ui/auth/forget_password/forget_password.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/update_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/cubit/app_language_cubit.dart';
import 'core/di/di.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showOnBoarding = prefs.getBool(OnBoarding.routeName) ?? false;

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppLanguageCubit()),
        ],
        child: MyApp(showOnBoarding: showOnBoarding),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showOnBoarding}) : super(key: key);
  final bool showOnBoarding;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppLanguageCubit, String>(
      builder: (context, appLanguage) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
          initialRoute: LoginView.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            OnBoarding.routeName: (context) => OnBoarding(),
            SplashScreen.routeName: (context) => SplashScreen(showOnBoarding: showOnBoarding,),
            LoginView.routeName: (context) => LoginView(),
            ForgetPassword.routeName: (context) => ForgetPassword(),
            UpdateProfile.routeName: (context) => UpdateProfile(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            ResetPassword.routeName: (context) => ResetPassword(),
            Profile.routeName: (context) => Profile(),
            HomeTab.routeName:(context)=>HomeTab()
          },
          locale: Locale(appLanguage),
        );
      },




    );
  }
}