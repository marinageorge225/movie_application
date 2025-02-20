import 'package:flutter/material.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import '../../core/utils/app_styles.dart';

class GenreTabBarWidget extends StatelessWidget {
  String genre;
  Color? borderColor;
  Color? boxColor;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  bool isSelected;

  GenreTabBarWidget(
      {required this.genre,
        required this.isSelected,
        this.borderColor,
        this.boxColor,
        this.selectedTextStyle,
        this.unSelectedTextStyle});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.008, horizontal: width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? boxColor ?? AppColors.orangeColor
              : AppColors.transparentColor,
          border: Border.all(
            color: borderColor ?? AppColors.orangeColor,
            width: 1.5,
          )),
      child: Text(
        genre,
        style: isSelected
            ? selectedTextStyle ?? AppStyles.bold20DarkBlackInter
            : unSelectedTextStyle ?? AppStyles.bold20OrangeInter,
      ),
    );
  }
}
