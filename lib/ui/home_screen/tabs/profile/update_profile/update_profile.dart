import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_view_model.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../bottom_sheet._show_avatar.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName="update_profile";


  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileViewModel viewModel = UpdateProfileViewModel();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.selectedAvatar=AssetsManager.avatar1;
    viewModel.getProfile();
  }



  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
  appBar: AppBar(title:Text("Pick Avatar"),
  scrolledUnderElevation: 0,),

  body: BlocBuilder<UpdateProfileViewModel, UpdateProfileStates>(
    bloc: viewModel,
    builder: (context, state){
      if(state is UpdateProfileInitialState){
        return Center(
          child: CircularProgressIndicator(color:  AppColors.orangeColor,),
        );
      }
      if(state is UpdateProfileErrorState){
        return Center(
          child: CircularProgressIndicator(color:  AppColors.redColor,),
        );
      }
      else if(state is LoadUserProfileState){
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: width*(16/430),left:  width*(16/430),
              top: height*(59/932),bottom: height*(33/932) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: InkWell(onTap: (){
                showBottomSheet(context, BottomSheetShowAvatars(saveImage: saveAvatarImage,
                    selectedAvatar: viewModel.selectedAvatar));
              },
                  child: Image.asset( viewModel.selectedAvatar != null?
                  viewModel.selectedAvatar!
                      : AssetsManager.avatar1))),
              SizedBox(height: height*(35/932),),
              CustomTextField(prefixIcon:const ImageIcon(AssetImage(AssetsManager.nameIcon)), controller: viewModel.nameController,),
              SizedBox(height: height*(19/932),),
              CustomTextField(prefixIcon:const ImageIcon(AssetImage(AssetsManager.phoneIcon)), controller: viewModel.phoneController,),
              TextButton(onPressed: (){},
                child: Text(AppLocalizations.of(context)!.resetPassword,style: AppStyles.regular20WhiteRoboto,),),

              SizedBox(height: height*0.24,),

              CustomElevatedButton(buttonOnClick: onClickDelete, buttonTitle: AppLocalizations.of(context)!.deleteAccount,
                buttonColor:AppColors.redColor ,buttonTitleStyle: AppStyles.regular20WhiteRoboto,),
              SizedBox(height: height*(19/932),),

              CustomElevatedButton(buttonOnClick: onClickUpdate, buttonTitle: AppLocalizations.of(context)!.updateData)
            ],
          ),
        ),
      );}
      return Container();
    },
  ),

);

  }

  onClickUpdate() {
  viewModel.updateProfile();
  }

  onClickDelete() {
  }
  void saveAvatarImage(String image) {
    setState(() {
      viewModel.selectedAvatar = image;
    });
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(backgroundColor: AppColors.transparentColor,
        context: context,
        builder: (context)=>widget

        );


  }
}
