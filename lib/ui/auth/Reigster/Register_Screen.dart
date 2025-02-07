import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
 import '../../../core/cubit/app_language_cubit.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import 'Avatar _widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "Register ";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  int selectedIndex = 0;
  String selectedAvatar = "";
  bool showPassword = false;
  bool showConfirmPassword = false;

  List<String> avatarPath = [
    AssetsManager.avatar1,
    AssetsManager.avatar2,
    AssetsManager.avatar3,
    AssetsManager.avatar4,
    AssetsManager.avatar5,
    AssetsManager.avatar6,
    AssetsManager.avatar7,
    AssetsManager.avatar8,
    AssetsManager.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var appLanguage = context.watch<AppLanguageCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: avatarPath.length,
                  itemBuilder: (context, index, itemIndex) {
                    return InkWell(
                      onTap: () {},
                      child: AvatarWidget(avatarPATH: avatarPath[index]),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    initialPage: 0,
                    height: height * 0.17,
                    disableCenter: true,
                    enlargeFactor: 0.6,
                    viewportFraction: 0.37,
                    onPageChanged: (index, changereson) {
                      selectedIndex = index;
                      selectedAvatar = avatarPath[selectedIndex];
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(AppLocalizations.of(context)!.avatar, style: AppStyles.regular16WhiteRoboto),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "* required please enter name";
                    } else {
                      return null;
                    }
                  },
                  keyBoardType: TextInputType.text,
                  prefixIcon: const ImageIcon(AssetImage(AssetsManager.nameID)),
                  hintText: AppLocalizations.of(context)!.name,
                  controller: nameController,
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
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.emailIcon)),
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
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
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                  hintText: AppLocalizations.of(context)!.password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off_sharp,
                    ),
                  ),
                  obscureText: !showPassword,
                  controller: passwordController,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "* required please enter ConfirmPassword";
                    }
                    if (text != confirmPasswordController.text) {
                      return "* ConfirmedPassword doesn't match the password";
                    }
                    return null;
                  },
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.passwordIcon)),
                  hintText: AppLocalizations.of(context)!.confirmPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showConfirmPassword = !showConfirmPassword;
                      });
                    },
                    icon: Icon(
                      showConfirmPassword ? Icons.visibility : Icons.visibility_off_sharp,
                    ),
                  ),
                  obscureText: !showConfirmPassword,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "* required please enter a valid Phone number";
                    }
                    if (text.length < 11) {
                      return "* Phone number Should not be less than 12 number ";
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.phone,
                  prefixIcon: ImageIcon(AssetImage(AssetsManager.phoneIcon)),
                  hintText: AppLocalizations.of(context)!.phoneNumber,
                  controller: phoneNumberController,
                ),
                SizedBox(height: height * 0.02),
                CustomElevatedButton(
                  buttonOnClick: onCreateAccountButton,
                  buttonTitle: AppLocalizations.of(context)!.createAccount,
                  buttonTitleStyle: AppStyles.regular20BlackRoboto,
                ),
                SizedBox(height: height * 0.02),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.alreadyHaveAccount,
                        style: AppStyles.regular16WhiteRoboto,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.login,
                        style: AppStyles.bold16Orange,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.25,
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
    );
  }

  void onCreateAccountButton() {
    if (formKey.currentState?.validate() == true) {
      Navigator.of(context).pushReplacementNamed(LoginView.routeName);
    }
  }
}
