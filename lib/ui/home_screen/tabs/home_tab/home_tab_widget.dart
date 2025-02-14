import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/movie_item.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../model/MovieListResponse.dart';

class HomeTab extends StatelessWidget {
  static const String routeName='HomeTab';

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Column(
          children: [
              BlocBuilder<HomeTabViewModel, HomeTabStates>(
                buildWhen: (previous, current){
                  if(current is HomeTabTopPartSuccessState ||
                      current is HomeTabTopPartErrorState){
                    return true;
                  }
                  return false;
                },
              bloc: viewModel..getMovies(),
              builder: (context, state) {
                if (state is HomeTabLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(color: AppColors.orangeColor));
                } else if (state is HomeTabTopPartErrorState) {
                  return Center(child: Text("Error: ${state.error}"));
                } else if (state is HomeTabTopPartSuccessState) {
                  var movies = state.movies;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      BlocBuilder<HomeTabViewModel, HomeTabStates>(
                        bloc: viewModel..changeBgImageIndex,
                        builder: (context, state) {
                          return Image.network(
                            movies[viewModel.bgImageIndex].largeCoverImage ?? '',
                            width: double.infinity,
                            height: height * 0.69,
                            fit: BoxFit.cover,
                          );
                        },
                      ),

                      // Gradient Overlay (Put AFTER the image)
                      Container(
                        height: height * 0.69,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.transparentBlack
                              , AppColors.blackColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(AssetsManager.availableNowImage),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CarouselSlider.builder(
                            options: CarouselOptions(
                                height: height * 0.38,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                initialPage: 0,
                                viewportFraction: 0.6,
                                aspectRatio: 1,
                                onPageChanged: (index, reason) {
                                  viewModel.changeBgImageIndex(index);
                                }),
                            itemCount: movies.length,
                            itemBuilder: (context, index, realIndex) {
                              var movie = movies[index];
                              return MovieItem(
                                imageWidth: width * 0.56,
                                imageHeight: height * 0.376,
                                movie: movie,
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Image.asset(AssetsManager.watchNowImage),
                        ],
                      )
                    ],
                  );
                } else {
                  return const Center(child: Text("No data found"));
                }
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                BlocBuilder<HomeTabViewModel, HomeTabStates>(
                  bloc: viewModel..changeGenre(),
                  builder: (context, state){
                    return Expanded(
                      child: Text(
                        viewModel.selectedGenre,
                        style: AppStyles.regular20WhiteRoboto,
                      ),
                    );
                  }
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: AppStyles.regular16OrangeRoboto,
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.orangeColor,
                          size: 15,
                        )
                      ],
                    ))
              ],
            ),
            BlocBuilder<HomeTabViewModel, HomeTabStates>(
              buildWhen: (previous, current){
                if(current is HomeTabBottomPartSuccessState ||
                current is HomeTabBottomPartErrorState){
                  return true;
                }
                return false;
              },
              bloc: viewModel..getMovieList(viewModel.selectedGenre),
                builder: (context, state) {
                  if (state is HomeTabLoadingState) {
                    return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.orangeColor,
                        ));
                  } else if (state is HomeTabBottomPartErrorState) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            state.errorMessage,
                            style: AppStyles.bold20WhiteRoboto,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orangeColor),
                              onPressed: () {
                                viewModel.getMovieList(viewModel.selectedGenre);
                              },
                              child: Text(
                                'Try Again',
                                style: AppStyles.regular20BlackRoboto,
                              ))
                        ],
                      ),
                    );
                  }
                  else if (state is HomeTabBottomPartSuccessState) {
                    final random = new Random();
                    final List<Movie> shuffledMovies = List.from(state.movieList)..shuffle(random);
                    return Container(
                      height: height * 0.22,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieItem(movie: shuffledMovies[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: width * 0.03,
                            );
                          },
                          itemCount:
                          state.movieList.length < 3 ? state.movieList.length : 3),
                    );
                  }
                  return Container(); //Unreachable
                }),
            SizedBox(
              height: height * 0.02,
            )
          ],
        ),
    );
  }
}