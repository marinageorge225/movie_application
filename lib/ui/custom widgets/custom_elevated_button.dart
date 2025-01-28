import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  Function buttonOnClick;
  String buttonTitle;
  Widget? buttonIcon;
  Color? buttonColor;
  TextStyle? buttonTitleStyle;

  CustomElevatedButton(
      {required this.buttonOnClick,
        required this.buttonTitle,
        this.buttonTitleStyle,
        this.buttonIcon,
        this.buttonColor});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor?? AppColors.orangeColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side:  BorderSide(color: buttonColor??AppColors.orangeColor, width: 1.5))),
        onPressed: () {
          buttonOnClick();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: height * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonIcon ?? SizedBox(),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                buttonTitle,
                style: buttonTitleStyle ?? AppStyles.regular20BlackRoboto,
              ),
            ],
          ),
        ));
  }
}