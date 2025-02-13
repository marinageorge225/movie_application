import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/api/api_manager_details_screen.dart';
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
    return BlocProvider(
      create: (context) =>
      MovieSuggestionViewModel(apiManager: ApiManagerDetailsScreen())..getMovieSuggestions(movieId),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(movieId: movie.id!),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(movie.mediumCoverImage ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Rating Badge (Top-Left)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating?.toStringAsFixed(1) ?? 'N/A',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
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
