import 'package:graduation_movie_app/core/error/failures.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class MovieSuggestionState{}

class MovieSuggestionInitialState extends MovieSuggestionState{}

class MovieSuggestionLoadingState extends MovieSuggestionState{}

class MovieSuggestionErrorState extends MovieSuggestionState{
  Failures error;
  MovieSuggestionErrorState({required this.error});
}

class MovieSuggestionSuccessState extends MovieSuggestionState{
  List<Movie> moviesList;
  MovieSuggestionSuccessState({required this.moviesList});
}
