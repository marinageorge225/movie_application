import 'package:bloc/bloc.dart';
import 'package:graduation_movie_app/model/MovieListResponse.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/search_tab/cubit/search_tab_states.dart';

import '../../../../../core/api/api_manger.dart';
import '../../../../../core/error/failures.dart';

class SearchTabViewModel extends Cubit<SearchStates> {
  final ApiManager apiManager;

  SearchTabViewModel({required this.apiManager}) : super(SearchInitialState());

  Future<void> searchMovies(String searchText) async {
    emit(SearchLoadingState());
    try {
      final movieResponse =
          await apiManager.getAllMovies(searchText.toLowerCase());

      if (movieResponse == null || movieResponse.data?.movies == null) {
        emit(SearchErrorState(error: Failures(errorMessage: 'No Movie Found')));
        return;
      }

      final List<Movie> filteredMovies = movieResponse.data!.movies!;

      if (filteredMovies.isEmpty) {
        emit(SearchErrorState(
            error: Failures(errorMessage: "No matching results")));
      } else {
        emit(SearchSuccessState(moviesList: filteredMovies));
      }
    } catch (e) {
      emit(SearchErrorState(error: Failures(errorMessage: e.toString())));
    }
  }
}
