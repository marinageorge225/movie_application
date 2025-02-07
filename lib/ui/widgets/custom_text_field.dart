import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_styles.dart';

typedef MyValidator = String? Function(String?);

class CustomTextField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  bool obscureText;
  MyValidator? validator;
  TextEditingController? controller;
  TextInputType? keyBoardType;
  CustomTextField(
      {this.suffixIcon,
      this.prefixIcon,
      this.hintText,
        this.keyBoardType,
      this.controller,
      this.obscureText = false,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyBoardType,
      style: AppStyles.regular16WhiteRoboto,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: AppColors.orangeColor,
      decoration: InputDecoration(
        errorStyle: AppStyles.regular16RedRoboto,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.whiteColor,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.whiteColor,
        hintText: hintText,
        hintStyle: AppStyles.regular16WhiteRoboto,
        filled: true,
        fillColor: AppColors.darkGrayColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.darkGrayColor,
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.darkGrayColor,
              width: 2,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 2,
            )
        ),
        focusedErrorBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
    color: AppColors.redColor,
    width: 2,
    )

      ),
      ),
    );
  }
}
