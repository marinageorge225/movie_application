
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_elevated_button.dart';
import 'package:graduation_movie_app/ui/custom%20widgets/custom_text_field.dart';
import 'package:graduation_movie_app/ui/tabs/profile_tab/bottom_sheet._show_avatar.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName="update_profile";


  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String? selectedAvatar;




  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
  appBar: AppBar(title:Text("Pick Avatar"),),
  body: Container(
    margin: EdgeInsets.only(right: width*(16/430),left:  width*(16/430),top: height*(59/932),bottom: height*(33/932) ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: InkWell(onTap: (){
          showBottomSheet(context, BottomSheetShowAvatars(saveImage: saveAvatarImage,
              selectedAvatar: selectedAvatar));
        },
            child: Image.asset( selectedAvatar != null?
            selectedAvatar!
                : AssetsManager.avatar1))),
        SizedBox(height: height*(35/932),),
        CustomTextField(prefixIcon:const ImageIcon(AssetImage(AssetsManager.nameIcon)),hintText: "name",),
        SizedBox(height: height*(19/932),),
        CustomTextField(prefixIcon:const ImageIcon(AssetImage(AssetsManager.phoneIcon)),hintText: "phone",),
        TextButton(onPressed: (){},
            child: Text("Reset Password",style: AppStyles.regular20WhiteRoboto,),),
        const Spacer(),
        CustomElevatedButton(buttonOnClick: onClickDelete, buttonTitle: "Delete Account",
          buttonColor:AppColors.redColor ,buttonTitleStyle: AppStyles.regular20WhiteRoboto,),
        SizedBox(height: height*(19/932),),

        CustomElevatedButton(buttonOnClick: onClickUpdate, buttonTitle: "Update Data")
      ],
    ),
  ),

);

  }

  onClickUpdate() {
  }

  onClickDelete() {
  }
  void saveAvatarImage(String image) {
    setState(() {
      selectedAvatar = image;
    });
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(backgroundColor: AppColors.Transparent,
        context: context,
        builder: (context)=>widget

        );


  }
}
