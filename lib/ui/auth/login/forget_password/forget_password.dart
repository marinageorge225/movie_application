import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';

import '../../../custom widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = 'Forget Password';
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(
          'Forget Password',
          style: AppStyles.regular16OrangeRoboto,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                AssetsManager.forgetPasswordImage,
                height: height * 0.45,
                width: width * 0.95,
              ),
            ),
            SizedBox(height: height * 0.01),

            // Email TextField
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: CustomTextField(
                keyBoardType: TextInputType.emailAddress,
                prefixIcon: ImageIcon(AssetImage(AssetsManager.emailIcon)),
                hintText: 'Email',
                controller: emailController,
              ),
            ),
            SizedBox(height: height * 0.03),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: CustomElevatedButton(
                  buttonOnClick: () {}, buttonTitle: 'Verify Email'),
            )
          ],
        ),
      ),
    );
  }
}
