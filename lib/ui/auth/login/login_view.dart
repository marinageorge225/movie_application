import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_text_field.dart';
import 'package:graduation_movie_app/ui/tabs/profile_tab/update_profile.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login_screen';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.015, vertical: height * 0.1),
        child: Column(
          spacing: height * 0.025,
          children: [
            Image.asset(AssetsManager.loginScreenImage,),

            SizedBox(height: height * 0.02,),

            CustomTextField(
              keyBoardType: TextInputType.emailAddress,
              prefixIcon: ImageIcon(AssetImage(AssetsManager.emailIcon)),
              hintText: 'Email',
            ),

            CustomTextField(
              prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
              hintText: 'Password',
              obscureText: showPassword == true ? false : true,
              suffixIcon: IconButton(
                  onPressed: (){
                    showPassword = !showPassword;
                    setState(() {

                    });
                  }, icon: Icon(
                showPassword == false ?
                  Icons.visibility_off_sharp
              : Icons.visibility)),
            ),

            TextButton(
                onPressed: (){},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forget Password ?',
                  style: AppStyles.regular16OrangeRoboto,),
                )),

            CustomElevatedButton(
                buttonOnClick: (){
                  Navigator.pushNamed(context, UpdateProfile.routeName);
                },
                buttonTitle: 'Login'),

            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Don't Have Account ? ",
                  style:  AppStyles.regular16WhiteRoboto),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {},
                  text: 'Create One',
                  style: AppStyles.bold16Orange)
            ])),

            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.orangeColor,
                    indent: width * 0.18,
                    endIndent: width * 0.03,
                  ),
                ),
                Text('OR',
                style: AppStyles.regular16OrangeRoboto,),
                Expanded(
                  child: Divider(
                    color: AppColors.orangeColor,
                    indent: width * 0.03,
                    endIndent: width * 0.18,
                  ),
                ),
              ],
            ),

            CustomElevatedButton(
                buttonOnClick: (){},
                buttonIcon: ImageIcon(AssetImage(AssetsManager.googleIcon),
                size: 30,
                color: AppColors.blackColor,),
                buttonTitle: 'Login With Google'),


          ],
        ),
      ),
    );
  }
}
