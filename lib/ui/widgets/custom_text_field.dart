import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';
import '../../core/utils/app_styles.dart';

typedef MyValidator = String? Function(String?);

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final bool obscureText;
  final MyValidator? validator;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.keyBoardType,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged, // ✅ Ensure this is passed correctly
  }) : super(key: key);

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
      onChanged: onChanged,
      // ✅ Properly added here
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
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.darkGrayColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
