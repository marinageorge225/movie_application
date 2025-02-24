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
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/watch_list/cubit/watch_list_view_model.dart';
  import 'package:graduation_movie_app/ui/widgets/custom_elevated_button.dart';
 import '../../../../core/di/di.dart';
 import '../../../../model/MovieDetailsResponse.dart';
import '../home_tab/movie_item.dart';

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
                toolbarHeight:height*(280/932) ,
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
                             //     Text("${watchlist.length}", style: AppStyles.bold36WhiteRoboto),
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
                scrolledUnderElevation: 0,
                leading: Container(),
                elevation: 0,
                leadingWidth: 0,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(height*(100/932)),
                  child: TabBar(
                    indicatorColor: AppColors.orangeColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 0,
                    indicatorWeight: 2,
                    labelStyle: AppStyles.regular20WhiteRoboto,
                    unselectedLabelStyle: AppStyles.regular20WhiteRoboto,
                    labelPadding: EdgeInsets.symmetric(vertical: height * 0.02),
                    tabs: const [
                      Tab(
                        child: Column(
                          children: [
                            ImageIcon(AssetImage(AssetsManager.watchListIcon), color: AppColors.orangeColor),
                            Expanded(child: Text("Watch List",)),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            ImageIcon(AssetImage(AssetsManager.historyIcon), color: AppColors.orangeColor),
                            Expanded(child: Text("History")),
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
              //todo: list watch
              WatchlistView(),
              Center(child: Image.asset(AssetsManager.noItemsFoundImage)),

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

        )
          ),

      )
    );
  }




}


 class WatchlistView extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return BlocBuilder<WatchListCubit, WatchListState>(
       builder: (context, state) {
         if (state is WatchListLoadingState) {
           return Center(child: CircularProgressIndicator());
         } else if (state is WatchListSuccessState) {
           if (state.movies.isEmpty) {
             return Center(child: Text("No movies in watchlist!"));
           }
           return GridView.builder(
             padding: EdgeInsets.all(10),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               childAspectRatio: 0.65,
             ),
             itemCount: state.movies.length,
             itemBuilder: (context, index) {
               final MovieDetailsResponse movie = state.movies[index];
               return WatchlistItem(movie: movie);
             },
           );
         } else {
           return Center(child: Text("Failed to load watchlist"));
         }
       },
     );
   }
 }

 class WatchlistItem extends StatelessWidget {
   final MovieDetailsResponse movie;

   const WatchlistItem({required this.movie});

   @override
   Widget build(BuildContext context) {
     return Card(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       child: Column(
         children: [
           Expanded(
             child: Image.network(movie.data!.movie!.smallCoverImage?? "", fit: BoxFit.cover),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               movie.data!.movie!.title?? "Unknown",
               style: TextStyle(fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),
           ),
         ],
       ),
     );
   }
 }
