import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/update_profile.dart';
import 'package:graduation_movie_app/ui/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/di.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  UpdateProfileViewModel viewModel = getIt<UpdateProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
                SliverAppBar(
                  toolbarHeight:height*(340/932) ,
                 backgroundColor: AppColors.darkGrayColor,
                 title:  BlocBuilder<UpdateProfileViewModel, UpdateProfileStates>(
                  bloc: viewModel..getProfile(),
                  builder: (context,state){

                    if(state is LoadProfileDataState){
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(viewModel.getAvatarImage(state.data.avaterId!)),
                                SizedBox(height: height * 0.02),
                                Text(state.data.name!, style: AppStyles.bold20WhiteRoboto),
                              ],
                            ),
                            Column(
                              children: [
                                Text("12", style: AppStyles.bold36WhiteRoboto),
                                Text("Wish List", style: AppStyles.bold24WhiteRoboto),
                              ],
                            ),
                            Column(
                              children: [
                                Text("12", style: AppStyles.bold36WhiteRoboto),
                                Text("History", style: AppStyles.bold24WhiteRoboto),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomElevatedButton(
                                buttonOnClick: () {
                                  Navigator.pushNamed(context, UpdateProfile.routeName);
                                },
                                buttonTitle: "Edit Profile",
                                buttonColor: AppColors.orangeColor,
                                buttonTitleStyle: AppStyles.regular20DarkGrayRoboto,
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Expanded(
                              flex: 1,
                              child: CustomElevatedButton(
                                buttonOnClick: () async{
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.remove("user_token");
                                  Navigator.of(context).pushNamedAndRemoveUntil(LoginView.routeName, (obj) => true);
                                },
                                buttonTitle: "Exit",
                                buttonIcon: Icon(Icons.exit_to_app_rounded, color: AppColors.whiteColor),
                                buttonColor: AppColors.redColor,
                                buttonTitleStyle: AppStyles.regular20WhiteRoboto,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );}
                    return Center(child: CircularProgressIndicator(color: AppColors.orangeColor,));
                  },

                ),
            pinned: true,
            floating: true,
            leading: Container(),
            elevation: 0,
            leadingWidth: 0,
            forceElevated: innerBoxIsScrolled,
            bottom: PreferredSize(
            preferredSize: Size.fromHeight(height*(70/932)),
            child: TabBar(
                    indicatorColor: AppColors.orangeColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,

                    tabs: [
                      Tab(
                        child: Column(
                          children: [
                            ImageIcon(AssetImage(AssetsManager.watchListIcon), color: AppColors.orangeColor),
                            Expanded(child: Text("Watch List", style: AppStyles.regular20WhiteRoboto)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            ImageIcon(AssetImage(AssetsManager.historyIcon), color: AppColors.orangeColor),
                            Expanded(child: Text("History", style: AppStyles.regular20WhiteRoboto)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              watchList(),
              history(),
            ],
          ),
        ),
      ),
    );
  }
}



Widget watchList() {
  return Image.asset(AssetsManager.noItemsFoundImage);
}

Widget history() {
  return Image.asset(AssetsManager.noItemsFoundImage);
}
