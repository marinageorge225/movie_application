import 'package:graduation_movie_app/core/error/failures.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  Failures error;

  SearchErrorState({required this.error});
}

class SearchSuccessState extends SearchStates {
  List<Movie> moviesList;

  SearchSuccessState({required this.moviesList});
}
