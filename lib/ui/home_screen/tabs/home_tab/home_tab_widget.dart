import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/assets_manager.dart';

import '../../../../api/api_manger.dart';
import '../../../../model/MovieResponse.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeTab';

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<MovieResponse?> movieResponse;

  @override
  void initState() {
    super.initState();
    movieResponse = ApiManager.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            AssetsManager.availableNow,
            height: height * 0.1,
            width: width * 0.7,
          ),
          FutureBuilder<MovieResponse?>(
            future: movieResponse,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
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
                                      movie.rating?.toStringAsFixed(1) ?? 'N/A',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
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
        ],
      ),
    );
  }
}
