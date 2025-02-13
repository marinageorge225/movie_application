import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/assets_manager.dart';
import 'package:graduation_movie_app/ui/movie_detailes_screen/Movie_Sugesstion/movie_suggestions_screen.dart';
import 'package:graduation_movie_app/ui/movie_detailes_screen/show_screen_shot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/app_styles.dart';
import '../../model/MovieDetailsResponse.dart';
import '../widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cubit/movie_details-states.dart';
import 'cubit/movie_details_view_model.dart';
import 'custom_icon_with_text.dart';
import 'package:readmore/readmore.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = "movie_details";
  final int movieId;

  MovieDetails({required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieDetailsCubit>(context).getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsError) {
            return Center(
              child: Text(
                  state.error, style: const TextStyle(color: Colors.white)),
            );
          } else if (state is MovieDetailsSuccess) {
            final movie = state.movie;

            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    movie.backgroundImage ?? movie.backgroundImageOriginal ??
                        '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                            Icons.movie, color: Colors.white, size:300  ),
                      );
                    },
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                       colors: [Colors.black.withOpacity(0.3), Colors.black],
                      ),
                    ),
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2,top:14),
                          child: IconButton(
                            icon: const Icon(
                                Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height * .3),
                      Center(
                        child: GestureDetector(
                          onTap: () =>
                              playTrailer(context, movie.ytTrailerCode),
                          child: Image.asset(
                            AssetsManager.onPlayIcon,
                          ),
                        ),
                      ),
                      SizedBox(height: height * .20),
                      Text(
                        movie.title ?? " ",
                        textAlign: TextAlign.center,
                        style: AppStyles.bold22white,
                      ),
                      SizedBox(height: height* .01),
                      Text(
                        movie.year?.toString() ?? " ",
                        style: const TextStyle(fontSize: 16, color: Colors
                            .grey),
                      ),
                      SizedBox(height: height* .01),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 59),
                        child: CustomElevatedButton(
                          buttonOnClick: () => onWatchButton(movie),
                          buttonTitle: 'Watch',
                          buttonTitleStyle: AppStyles.bold24WhiteInter,
                          buttonColor: AppColors.redColor,
                        ),
                      ),
                       // SizedBox(height: height* .20),

                      SizedBox(height: height*(16/932)),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width*(16/430)),
                        child: Row(
                          children: [
                            CustomIconWithText(imagePath: AssetsManager.favouriteIcon, text: movie.likeCount!.toString()),
                            SizedBox(width: width*(16/430)),
                            CustomIconWithText(imagePath: AssetsManager.watchesIcon, text: movie.runtime!.toString()),
                            SizedBox(width: width*(16/430)),

                            CustomIconWithText(imagePath: AssetsManager.starIcon, text: movie.rating!.toString()),




                          ],
                        ),
                      ),
                      SizedBox(height: height*(16/932)),
                      Container(alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(horizontal: width*(15/430)),
                          child: Text("Screen Shots",style: AppStyles.bold24WhiteRoboto,)),
                      SizedBox(height: height*(16/932)),
                      ShowScreenShot(imageUrl: movie.largeScreenshotImage1!),
                      SizedBox(height: height*(14/932)),
                      ShowScreenShot(imageUrl: movie.largeScreenshotImage2!),
                      SizedBox(height: height*(14/932)),
                      ShowScreenShot(imageUrl: movie.largeScreenshotImage3!),
                      SizedBox(height: height*(30/932)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Similar',style: AppStyles.bold22white,),
                          ],
                        ),
                      ),
                      SizedBox(height: height*(30/932)),
                      MovieSuggestionScreen(movieId: widget.movieId.toString()),
                      SizedBox(height: height*(30/932)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Summary',style: AppStyles.bold22white,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ReadMoreText(
                          movie.descriptionFull!,
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          colorClickableText: AppColors.whiteColor, // Ensures clickable text is white
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          style: AppStyles.regular14WhiteRoboto.copyWith(color: Colors.white), // Set text color to white
                          moreStyle: AppStyles.regular14WhiteRoboto.copyWith(color: AppColors.orangeColor), // "Show more" color
                          lessStyle: AppStyles.regular14WhiteRoboto.copyWith(color: AppColors.orangeColor), // "Show less" color
                        ),
                      )




                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: Text("No Data", style: TextStyle(color: Colors.white)));
          }
        },
      ),

    );
  }
  void playTrailer(BuildContext context, String? trailerCode) async {
    if (trailerCode != null && trailerCode.isNotEmpty) {
      var youtubeUrl = "https://www.youtube.com/watch?v=$trailerCode";
      if (await canLaunch(youtubeUrl)) {
        await launch(youtubeUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No trailer available"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
  void onWatchButton(Movie movie) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> watchlist = prefs.getStringList('watchlist') ?? [];

    String message;

    if (!watchlist.contains(movie.id.toString())) {
      watchlist.add(movie.id.toString());
      await prefs.setStringList('watchlist', watchlist);
      message = "  ${movie.title} has been added to your watchlist!";
    } else {
      message = "  ${movie.title} is already in your watchlist!";
    }

    print(" Current Watchlist: $watchlist");


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.redColor,
      ),
    );

    setState(() {});
  }

}