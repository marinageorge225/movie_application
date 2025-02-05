import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

class AppTheme{
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(titleTextStyle: AppStyles.regular16OrangeRoboto
        ,centerTitle: true,
        backgroundColor:  AppColors.blackColor
        ,iconTheme: const IconThemeData(color: AppColors.orangeColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.orangeColor,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}