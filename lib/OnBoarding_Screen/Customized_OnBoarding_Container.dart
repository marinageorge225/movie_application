import 'package:flutter/material.dart';
import '../core/utils/app_color.dart';
import '../core/utils/app_styles.dart';
import '../ui/widgets/custom_elevated_button.dart';

class CustomizedOnboardingContainer extends StatelessWidget {
  Color? backgroundColor;
  String? title;
  String? body;
  TextStyle? titleStyle;
  TextStyle? bodyStyle;
  String textBottom;
  TextStyle? textBottomStyle;
  String? textBottom2;
  TextStyle? textBottom2Style;

  Function onPressed;
  Function? onPressed2;
  Color? bottomColor;
  CustomizedOnboardingContainer({
    this.bottomColor,
    this.body,
    this.title,
    required this.onPressed,
    this.onPressed2,
    this.backgroundColor,
    this.bodyStyle,
    this.textBottom2,
    required this.textBottom,
    this.textBottomStyle,
    this.titleStyle,
    this.textBottom2Style,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: backgroundColor ?? AppColors.blackColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? "",
            style: titleStyle ?? AppStyles.bold24WhiteInter,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(body ?? "",
              style: bodyStyle ?? AppStyles.regular20WhiteInter,
              textAlign: TextAlign.center),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: CustomElevatedButton(
                  buttonTitleStyle:
                      textBottomStyle ?? AppStyles.semiBold20BlackInter,
                  buttonOnClick: onPressed,
                  buttonTitle: textBottom)),
          SizedBox(
            height: height * 0.02,
          ),
          textBottom2 == null
              ? const SizedBox(
                  height: 0,
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: CustomElevatedButton(
                    borderColor: AppColors.orangeColor,
                      buttonColor: AppColors.transparentColor,
                      buttonTitleStyle:
                          textBottom2Style ?? AppStyles.semiBold20BlackInter,
                      buttonOnClick: onPressed2 ?? () {},
                      buttonTitle: textBottom2 ?? "")),
        ],
      ),
    );
  }
}
