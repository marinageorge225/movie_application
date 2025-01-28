import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_text_field.dart';
import 'package:graduation_movie_app/ui/tabs/profile_tab/update_profile.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';
import '../forget_password/forget_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      backgroundColor: AppColors.blackColor,

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
                height: height * 0.2,
              ),

              SizedBox(height: height * 0.02),

              CustomTextField(
                keyBoardType: TextInputType.emailAddress,
                prefixIcon: const ImageIcon(AssetImage(AssetsManager.emailIcon)),
                hintText: AppLocalizations.of(context)!.email,
                controller: emailController,
              ),

              SizedBox(height: height * 0.02),


              CustomTextField(
                prefixIcon: const ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                hintText: AppLocalizations.of(context)!.password,
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
                    Navigator.pushNamed(context, ForgetPassword.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: AppStyles.regular16OrangeRoboto,
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Login Button
              CustomElevatedButton(
                buttonOnClick: () {
                  // Add login logic here
                Navigator.pushNamed(context, UpdateProfile.routeName);

                },
                buttonTitle: AppLocalizations.of(context)!.login,
              ),

              SizedBox(height: height * 0.02),

              // Create Account RichText
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.dontHaveAccount,
                      style: AppStyles.regular16WhiteRoboto,
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.createOne,
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
                    AppLocalizations.of(context)!.or,
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
                buttonIcon: const ImageIcon(
                  AssetImage(AssetsManager.googleIcon),
                  size: 30,
                  color: AppColors.blackColor,
                ),
                buttonTitle: AppLocalizations.of(context)!.loginWithGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
