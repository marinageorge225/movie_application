import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/1st_part_home_tab/home_1st_part_view_model.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/assets_manager.dart';

class FirstPartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<FirstPartHomeViewModel, HomeTabState>(
      builder: (context, state) {
        if (state is HomeTabLoading) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.orangeColor));
        } else if (state is HomeTabError) {
          return Center(child: Text("Error: ${state.error}"));
        } else if (state is HomeTabLoaded) {
          var movies = state.movies;
          return Column(
            children: [
              Image.asset(
                AssetsManager.availableNowImage,
                height: height * 0.1,
                width: width * 0.7,
              ),
              CarouselSlider.builder(
                itemCount: movies.length,
                itemBuilder: (context, index, realIndex) {
                  var movie = movies[index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie.mediumCoverImage ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(AssetsManager.onboarding6ThImage);
                          },
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                movie.rating?.toStringAsFixed(1) ?? 'N/A',
                                style: AppStyles.regular16WhiteRoboto,
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
                  height: height * 0.3,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  aspectRatio: 1,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text("No data found"));
        }
      },
    );
  }
}
