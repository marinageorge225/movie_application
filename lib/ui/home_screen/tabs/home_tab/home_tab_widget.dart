import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/di/di.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tap_bottom_part.dart';
import '../../../../core/api/api_manger.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_styles.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<MovieListResponse?> movieListResponse ;
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieListResponse = ApiManager.getMovies();
    viewModel.changeGenre();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: BlocProvider(
          create: (context) => viewModel,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(colors: [Colors.grey,
                      AppColors.blackColor
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(bounds),
                    child: Image.asset(
                      AssetsManager.onboarding6ThImage,
                      width: double.infinity,
                      height: height * 0.69,
                      fit: BoxFit.cover,
                    ),
                  ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.availableNowImage),
                      SizedBox(height: height * 0.03,),
                      FutureBuilder<MovieListResponse?>(
                        future: movieListResponse,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.orangeColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                          } else if (snapshot.hasData) {
                            var movies = snapshot.data?.data?.movies ?? [];

                            // Sort movies by year (newest to oldest)
                            movies.sort((a, b) => (b.year ?? 0).compareTo(a.year ?? 0));

                            return Column(
                              children: [
                                CarouselSlider.builder(
                                  itemCount: movies.length,
                                  itemBuilder: (context, index, realIndex) {
                                    var movie = movies[index];
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(
                                            height: height * 0.37,
                                            movie.largeCoverImage ?? '',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.6),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  movie.rating?.toStringAsFixed(1) ?? 'N/A',
                                                  style: const TextStyle(
                                                      color: Colors.white, fontSize: 14),
                                                ),
                                                const SizedBox(width: 4),
                                                const Icon(Icons.star,
                                                    color: Colors.yellow, size: 16),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: height * 0.37,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.54,
                                    aspectRatio: 1,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Center(child: Text("No data found"));
                          }
                        },
                      ),
                      SizedBox(height: height * 0.03,),
                      Image.asset(AssetsManager.watchNowImage)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                    child: Text(
                      viewModel.selectedGenre,
                      style: AppStyles.regular20WhiteRoboto,
                    ),
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
              HomeTapBottomPart(
                genre: viewModel.selectedGenre,
              ),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      );
  }
}
