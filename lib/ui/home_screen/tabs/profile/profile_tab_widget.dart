import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/ui/auth/login/login_view.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/cubit/update_profile_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/update_profile.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_view_model.dart' show WatchListCubit;
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/watch_listt_screen.dart';
import 'package:graduation_movie_app/ui/widgets/custom_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/di.dart';
import '../../../../model/MovieDetailsResponse.dart';
import '../home_tab/movie_item.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  UpdateProfileViewModel viewModel = getIt<UpdateProfileViewModel>();
  WatchListCubit watchListCubit = getIt<WatchListCubit>();

  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("auth_token");
    });
    if (token != null) {
      watchListCubit.fetchWatchlist(token!);
    }
  }

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
                title:  BlocBuilder<UpdateProfileViewModel, ProfileStates>(
                  bloc: viewModel..getProfileData(),
                  builder: (context,state){

                    if(state is GetProfileDataState){
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
                                  Text("${state.data.watchList?.length}", style: AppStyles.bold36WhiteRoboto),
                                  Text("Wish List", style: AppStyles.bold24WhiteRoboto),
                                ],
                              ),

                              Column(
                                children: [
                                  Text("${state.historyMovies.length}", style: AppStyles.bold36WhiteRoboto),
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
                                    // final prefs = await SharedPreferences.getInstance();
                                    // prefs.remove("user_token");

                                    Navigator.of(context).pushNamedAndRemoveUntil(LoginView.routeName, (obj) => true);
                                  },
                                  buttonTitle: "Exit",
                                  buttonIcon: const Icon(Icons.exit_to_app_rounded, color: AppColors.whiteColor),
                                  buttonColor: AppColors.redColor,
                                  buttonTitleStyle: AppStyles.regular20WhiteRoboto,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );}
                    return const Center(child: CircularProgressIndicator(color: AppColors.orangeColor,));
                  },

                ),
                pinned: true,
                floating: true,
                leading: Container(),
                elevation: 0,
                leadingWidth: 0,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(height*(60/932)),
                  child: TabBar(
                    indicatorColor: AppColors.orangeColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    indicatorWeight: 2,
                    labelPadding: EdgeInsets.symmetric(vertical: height * 0.02),
                    tabs: [
                      Tab(
                        child: Column(
                          children: [
                            const ImageIcon(AssetImage(AssetsManager.watchListIcon), color: AppColors.orangeColor),
                            Expanded(child: Text("Watch List", style: AppStyles.regular20WhiteRoboto)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            const ImageIcon(AssetImage(AssetsManager.historyIcon), color: AppColors.orangeColor),
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
              WatchListScreen(token: token ?? ''),

              BlocBuilder<UpdateProfileViewModel, ProfileStates>(
                bloc: viewModel..getProfileData(),
                builder: (context, state) {
                  if (state is GetProfileDataState) {
                    return state.historyMovies.isEmpty
                        ? Center(
                      child: Image.asset(
                          AssetsManager.noItemsFoundImage),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal:10 ,vertical:8 ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) => MovieItem(
                        movie: state.historyMovies[index],
                      ),
                      itemCount: state.historyMovies.length,
                    );
                  }
                  return const Center(child: CircularProgressIndicator(color: AppColors.orangeColor,));
                },
              ),
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