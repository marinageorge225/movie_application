import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/auth/login/forget_password/forget_password.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_text_field.dart';
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


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.015,
            vertical: height * 0.1,
          ),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.loginScreenImage,
                height: height * 0.25,
              ),

              SizedBox(height: height * 0.02),

              CustomTextField(
                keyBoardType: TextInputType.emailAddress,
                prefixIcon: ImageIcon(AssetImage(AssetsManager.emailIcon)),
                hintText: 'Email',
                controller: emailController,
              ),

              SizedBox(height: height * 0.02),


              CustomTextField(
                prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                hintText: 'Password',
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                    showPassword
                        ? Icons.visibility
                        : Icons.visibility_off_sharp,
                  ),
                ),
                controller: passwordController,
              ),


              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgetPassword();
                  },
                  child: Text(
                    'Forget Password?',
                    style: AppStyles.regular16OrangeRoboto,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Login Button
              CustomElevatedButton(
                buttonOnClick: () {
                  // Add login logic here
                },
                buttonTitle: 'Login',
              ),

              SizedBox(height: height * 0.02),

              // Create Account RichText
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't Have an Account? ",
                      style: AppStyles.regular16WhiteRoboto,
                    ),
                    TextSpan(
                      text: 'Create One',
                      style: AppStyles.bold16Orange,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Create Account Screen
                        },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03),

              // OR Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.orangeColor,
                      indent: width * 0.18,
                      endIndent: width * 0.03,
                    ),
                  ),
                  Text(
                    'OR',
                    style: AppStyles.regular16OrangeRoboto,
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.orangeColor,
                      indent: width * 0.03,
                      endIndent: width * 0.18,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.03),

              // Login with Google Button
              CustomElevatedButton(
                buttonOnClick: () {
                  // Add Google login logic here
                },
                buttonIcon: ImageIcon(
                  AssetImage(AssetsManager.googleIcon),
                  size: 30,
                  color: AppColors.blackColor,
                ),
                buttonTitle: 'Login With Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
