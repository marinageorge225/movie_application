import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  final TextEditingController oldPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  bool showPassword = false;

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
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(
          AppLocalizations.of(context)!.forgetPassword,
          style: AppStyles.regular16OrangeRoboto,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.orangeColor),
          onPressed: () => Navigator.of(context).pop(),
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
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off_sharp,
                  ),
                ),
                controller: oldPasswordController,
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
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off_sharp,
                  ),
                ),
                controller: newPasswordController,
              ),
            ),
            SizedBox(height: height * 0.03),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: CustomElevatedButton(
                  buttonOnClick: () {}, buttonTitle: "Reset Password"),
            )
          ],
        ),
      ),
    );
  }
}
