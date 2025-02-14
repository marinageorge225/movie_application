import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/dialog_utils.dart';
import 'package:graduation_movie_app/ui/auth/forget_password/cubit/reset_password_states.dart';
import 'package:graduation_movie_app/ui/auth/forget_password/cubit/reset_password_view_model.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/assets_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = 'Reset Password';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  var viewModel=getIt<ResetPasswordViewModel>();

  bool showOldPassword = false;
  bool showNewPassword = false;


  void toggleOldPasswordVisibility() {
    setState(() {
      showOldPassword = !showOldPassword;
    });
  }

  void toggleNewPasswordVisibility() {
    setState(() {
      showNewPassword = !showNewPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(
          AppLocalizations.of(context)!.resetPassword,
          style: AppStyles.regular16OrangeRoboto,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.orangeColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: BlocListener(
        bloc: viewModel,
        listener: (context,state){
          if (state is ResetPasswordLoading){
          DialogUtils.showLoading(context: context);

          }
          else if (state is ResetPasswordSuccess){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: state.message,title: "Success",
                posActionName: "Ok"
                ,posAction: (){
              Navigator.pop(context);
            });

          }
          else if (state is ResetPasswordFailure){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: state.errorMessage,title: "Error");

          }
        },
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
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
                  child:
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
                    hintText: "Old Password",
                    obscureText: !showOldPassword,
                    suffixIcon: IconButton(
                      onPressed: toggleOldPasswordVisibility,
                      icon: Icon(
                        showOldPassword ? Icons.visibility : Icons.visibility_off_sharp,
                      ),
                    ),
                    controller: viewModel.oldPasswordController,
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child:
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
                    hintText: "New Password",
                    obscureText: !showNewPassword,
                    suffixIcon: IconButton(
                      onPressed: toggleNewPasswordVisibility,
                      icon: Icon(
                        showNewPassword ? Icons.visibility : Icons.visibility_off_sharp,
                      ),
                    ),
                    controller: viewModel.newPasswordController,
                  ),
                ),
                SizedBox(height: height * 0.03),


                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: CustomElevatedButton(
                      buttonOnClick: () {

                        viewModel.resetPassword();
                      }, buttonTitle: "Reset Password"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
