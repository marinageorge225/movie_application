import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/auth/login/login_connector.dart';
import 'package:graduation_movie_app/ui/home_screen/home_screen.dart';
import '../../../core/api/api_manger.dart';
import '../../../core/cubit/app_language_cubit.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import '../Reigster/Register_Screen.dart';
import '../forget_password/forget_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'cubit/login_states.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login_screen';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> implements LoginConnector {
  bool showPassword = false;

  var viewModel=LoginViewModel(ApiManager());

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this ;

  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appLanguage = context.watch<AppLanguageCubit>().state;

    return BlocProvider(
        create: (context) => viewModel,

      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showLoading();

          } else if (state is LoginFailure) {
            hideLoading();
            showMassage(state.errorMessage);
          }else if (state is LoginSuccess) {
            hideLoading();
            showMassage(state.message);
            navigateToScreen();

          }
        },
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.015,
                vertical: height * 0.1,

              ),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AssetsManager.loginScreenImage,
                      height: height * 0.2,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "* required please enter the email";
                        }
                        final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return "* please enter valid email ";
                        }
                        return null;
                      },
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon:const ImageIcon(AssetImage(AssetsManager.emailIcon)),
                      hintText: AppLocalizations.of(context)!.email,
                      controller:  viewModel.emailController,
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "* required please enter password";
                        }
                        if (text.length < 8) {
                          return "* password should be 8 characters at least";
                        }
                        return null;
                      },
                      prefixIcon: const ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: !showPassword,
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(
                          showPassword ? Icons.visibility : Icons.visibility_off_sharp,
                        ),
                      ),
                      controller: viewModel.passwordController,
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
                    CustomElevatedButton(
                      buttonOnClick:()async{
                      await  viewModel.validateAndLogin(
                            viewModel.emailController.text,
                            viewModel.passwordController.text, viewModel.formKey);
                      }
                      ,
                      buttonTitle: AppLocalizations.of(context)!.login,
                    ),
                    SizedBox(height: height * 0.02),
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
                                Navigator.of(context).pushNamed(RegisterScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
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
                    CustomElevatedButton(
                      buttonOnClick: () {
                        // Google login logic
                      },
                      buttonIcon: const ImageIcon(
                        AssetImage(AssetsManager.googleIcon),
                        size: 30,
                        color: AppColors.blackColor,
                      ),
                      buttonTitle: AppLocalizations.of(context)!.loginWithGoogle,
                    ),
                    SizedBox(height: height * 0.03),


                    Container(
                      width: width * (92 / 430),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.orangeColor, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<AppLanguageCubit>().changeLanguage('en');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: appLanguage == 'en' ? AppColors.orangeColor : AppColors.transparentColor,
                                  width: 3,
                                ),
                              ),
                              child: Image.asset(AssetsManager.englishLanguageIcon),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<AppLanguageCubit>().changeLanguage('ar');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: appLanguage == 'ar' ? AppColors.orangeColor : AppColors.transparentColor,
                                  width: 3,
                                ),
                              ),
                              child: Image.asset(AssetsManager.arabicLanguageIcon),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void navigateToScreen() {
    Navigator.pushNamed(context,HomeScreen.routeName);
  }

  @override
  void showLoading() {
    DialogUtils.showLoading(context: context) ;
  }

  @override
  void showMassage(String massage) {
    DialogUtils.showMessage(context: context, message: massage,posActionName: "ok");
  }

}
