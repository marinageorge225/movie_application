import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/core/api/api_manager_details_screen.dart';
import 'package:graduation_movie_app/ui/movie_detailes_screen/Movie_Sugesstion/cubit/movie_suggestions_states.dart';
import 'package:graduation_movie_app/core/error/failures.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';

class MovieSuggestionViewModel extends Cubit<MovieSuggestionState> {
  final ApiManagerDetailsScreen apiManager;

  MovieSuggestionViewModel({required this.apiManager}) : super(MovieSuggestionInitialState());

  void getMovieSuggestions(String movieId) async {
    try {
      emit(MovieSuggestionLoadingState());

      int id = int.tryParse(movieId) ?? -1;
      if (id == -1) {
        emit(MovieSuggestionErrorState(error: ServerError(errorMessage: "Invalid movie ID")));
        return;
      }

      var response = await apiManager.getMovieSuggestions(id);

      if (response.status == 'error') {
        emit(MovieSuggestionErrorState(
          error: ServerError(errorMessage: response.statusMessage ?? "Unknown server error"),
        ));
        return;
      }
      List<Movie> movies = response.data?.movies ?? [];

      if (movies.isNotEmpty) {
        emit(MovieSuggestionSuccessState(moviesList: movies));
      } else {
        emit(MovieSuggestionErrorState(
          error: ServerError(errorMessage: "No movies found"),
        ));
      }
    } catch (e) {
      if (e.toString().contains("Failed host lookup") || e.toString().contains("SocketException")) {
        emit(MovieSuggestionErrorState(error: NetworkError(errorMessage: "No internet connection")));
      } else {
        emit(MovieSuggestionErrorState(error: ServerError(errorMessage: e.toString())));
      }
    }
  }
}
