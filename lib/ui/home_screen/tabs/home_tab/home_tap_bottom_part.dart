import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/movie_item.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

import '../../../../utils/app_color.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tap_view_model.dart';

class HomeTapBottomPart extends StatefulWidget {
  String genre;
  HomeTapBottomPart({required this.genre});
  @override
  State<HomeTapBottomPart> createState() => _HomeTapBottomPartState();
}

class _HomeTapBottomPartState extends State<HomeTapBottomPart> {
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMovieList(widget.genre);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
          builder: (context, state) {
            if (state is HomeTabLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orangeColor,
                  ));
            }else if(state is HomeTabErrorState){
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage,
                      style: AppStyles.bold20WhiteRoboto,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeColor
                      ),
                        onPressed: (){
                          viewModel.getMovieList(widget.genre);
                        },
                        child: Text('Try Again', style: AppStyles.regular20BlackRoboto,))
                  ],
                ),
              );
            }else if(state is HomeTabSuccessState){
              return Container(
                height: height * 0.25,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  scrollDirection: Axis.horizontal ,
                    itemBuilder: (context, index){
                      return MovieItem(movie: (state.movieList..shuffle()).first);
                    },
                    separatorBuilder: (context, index){
                      return Container(width: width * 0.03,);
                    },
                    itemCount: state.movieList.length < 3 ?  state.movieList.length : 3),
              );
            }
            return Container(); //Unreachable
          }),
    );
  }
}
