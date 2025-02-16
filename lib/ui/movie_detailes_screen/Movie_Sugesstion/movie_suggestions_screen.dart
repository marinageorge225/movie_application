import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manger.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/movie_item.dart';
import '../../../core/utils/app_styles.dart';
import '../movieDetails.dart';
import 'cubit/movie_suggestion_view_model.dart';
import 'cubit/movie_suggestions_states.dart';

class MovieSuggestionScreen extends StatelessWidget {
  static const String routeName = "MovieSuggestionScreen";
  final String movieId;

  const MovieSuggestionScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
      MovieSuggestionViewModel(apiManager: ApiManager())..getMovieSuggestions(movieId),
      child: BlocBuilder<MovieSuggestionViewModel, MovieSuggestionState>(
        builder: (context, state) {
          if (state is MovieSuggestionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieSuggestionErrorState) {
            return Center(
              child: Text(
                state.error.errorMessage,
                style: AppStyles.regular16WhiteRoboto,
              ),
            );
          } else if (state is MovieSuggestionSuccessState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemCount: state.moviesList.length,
              itemBuilder: (context, index) {
                final movie = state.moviesList[index];
                return MovieItem(
                  imageHeight: height * 0.3,
                    imageWidth: width * 0.5,
                    movie: movie);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
