import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';

import 'home_tab_view_model.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = 'HomeTab';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => HomeTabViewModel()..getMovies(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Image.asset(
              AssetsManager.availableNow,
              height: height * 0.1,
              width: width * 0.7,
            ),
            Expanded(
              child: BlocBuilder<HomeTabViewModel, HomeTabState>(
                builder: (context, state) {
                  if (state is HomeTabLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orangeColor,
                      ),
                    );
                  } else if (state is HomeTabError) {
                    return Center(child: Text("Error: ${state.error}"));
                  } else if (state is HomeTabLoaded) {
                    var movies = state.movies;
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, realIndex) {
                            var movie = movies[index];
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    movie.largeCoverImage ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          movie.rating?.toStringAsFixed(1) ??
                                              'N/A',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          options: CarouselOptions(
                            height: 250,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.4,
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
            ),
          ],
        ),
      ),
    );
  }
}
