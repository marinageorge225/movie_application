import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_styles.dart';

class AppTheme{
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(titleTextStyle: AppStyles.regular16OrangeRoboto
        ,centerTitle: true,
        backgroundColor:  AppColors.blackColor
        ,iconTheme: const IconThemeData(color: AppColors.orangeColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: AppColors.orangeColor,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}